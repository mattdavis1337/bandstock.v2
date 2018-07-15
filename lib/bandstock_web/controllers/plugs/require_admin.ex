defmodule BandstockWeb.Plugs.RequireAdmin do
	import Plug.Conn
	import Phoenix.Controller

	alias BandstockWeb.Router.Helpers
	alias Bandstock.Repo
	alias Bandstock.Account.User

	def init(_params) do

	end

	def call(conn, _params) do
		user_id = get_session(conn, :user_id)
    user = user_id && Repo.get(User, user_id)

    if(user && user.admin) do
      conn
    else
      conn
      |> put_flash(:error, "Not allowed.")
      |> redirect(to: "/")
      |> halt()
    end
  end
end
