defmodule LiveFlashAcrossLiveSessionWeb.PageController do
  use LiveFlashAcrossLiveSessionWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
