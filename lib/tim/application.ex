defmodule Tim.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: Tim.Worker.start_link(arg)
      # {Tim.Worker, arg},
      Plug.Adapters.Cowboy.child_spec(:http, Tim.Endpoint, [], port: 4001)
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Tim.Supervisor]
    Logger.info("Started application")
    Supervisor.start_link(children, opts)
  end
end
