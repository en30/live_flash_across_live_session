defmodule LiveFlashAcrossLiveSession.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      LiveFlashAcrossLiveSession.Repo,
      # Start the Telemetry supervisor
      LiveFlashAcrossLiveSessionWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: LiveFlashAcrossLiveSession.PubSub},
      # Start the Endpoint (http/https)
      LiveFlashAcrossLiveSessionWeb.Endpoint
      # Start a worker by calling: LiveFlashAcrossLiveSession.Worker.start_link(arg)
      # {LiveFlashAcrossLiveSession.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveFlashAcrossLiveSession.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LiveFlashAcrossLiveSessionWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
