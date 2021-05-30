defmodule MeseStats.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      MeseStats.Repo,
      # Start the Telemetry supervisor
      MeseStatsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: MeseStats.PubSub},
      # Start the Endpoint (http/https)
      MeseStatsWeb.Endpoint
      # Start a worker by calling: MeseStats.Worker.start_link(arg)
      # {MeseStats.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MeseStats.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    MeseStatsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
