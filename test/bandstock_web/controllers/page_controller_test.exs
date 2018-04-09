defmodule BandstockWeb.PageControllerTest do
  use BandstockWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "The beautiful game"
  end
end
