defmodule BandstockWeb.Plugs.RequireAuth do
	import Plug.Conn
	import Phoenix.Controller

	alias BandstockWeb.Router.Helpers
	alias Bandstock.Repo
	alias Bandstock.Account.User

	def init(_params) do

	end

	def call(conn, _params) do
		user_id = get_session(conn, :user_id)
		cond do
			conn.assigns[:user] ->
				conn
			user = user_id && Repo.get(User, user_id) ->    #if user_id exists, then rs of && happens, gets user, then assigns result to user
				conn = assign(conn, :user, user) #conn.assigns.user
				conn
			true ->
				conn
				|> put_flash(:error, "You must be logged in.")
				|> redirect(to: "/")
				|> halt()
		end
	end
end
