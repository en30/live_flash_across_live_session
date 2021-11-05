defmodule LiveFlashAcrossLiveSessionWeb.PageLive do
  use LiveFlashAcrossLiveSessionWeb, :live_view

  def mount(_params, session, socket) do
    socket =
      socket
      |> IO.inspect()
      |> assign(:live_session, session["live_session"])

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div>live_session :<%= @live_session %></div>
    <button phx-click="redirect" phx-value-to="/session-a">Redirect to A</button>
    <button phx-click="push-redirect" phx-value-to="/session-a">Push Redirect to A</button>
    <button phx-click="redirect" phx-value-to="/session-b">Redirect to B</button>
    <button phx-click="push-redirect" phx-value-to="/session-b">Push Redirect to B</button>
    """
  end

  def handle_event("push-redirect", %{"to" => to}, socket) do
    socket =
      socket
      |> put_flash(:info, "test flash")
      |> push_redirect(to: to)

    {:noreply, socket}
  end

  def handle_event("redirect", %{"to" => to}, socket) do
    socket =
      socket
      |> put_flash(:info, "test flash")
      |> redirect(to: to)

    {:noreply, socket}
  end
end
