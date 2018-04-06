defmodule BandstockWeb.PageController do
  use BandstockWeb, :controller

  def index(conn, _params) do
  	#IO.puts("yoyoyo")
  	#IO.inspect(Bandstock.GraphicMagic.magic)
    render conn, "index.html"
  end
end
