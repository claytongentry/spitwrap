defmodule SpitwrapWeb.PageController do
  use SpitwrapWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
