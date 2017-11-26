defmodule SpitwrapWeb.PageControllerTest do
  use SpitwrapWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Kweezy Spit"
  end
end
