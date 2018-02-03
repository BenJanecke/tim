defmodule Tim.Endpoint do
  use Plug.Router

  plug :match
  plug Plug.Logger
  plug Plug.Parsers, parsers: [:json],
                     pass:  ["application/json"],
                     json_decoder: Poison
  plug :dispatch

  get("/", do: send_resp(conn, 200, "Welcome"))
  post "/" do
    IO.inspect conn.body_params
    send_resp(conn, 200, "Ofgdfgfops!")
  end
  match(_, do: send_resp(conn, 404, "Oops!"))
end
