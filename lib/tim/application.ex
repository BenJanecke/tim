defmodule Tim.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      Plug.Adapters.Cowboy.child_spec(scheme: :http, plug: MyRouter, options: [port: 4001])
    ]

    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Tim.Supervisor]
    Supervisor.start_link(children, opts)
  end
end