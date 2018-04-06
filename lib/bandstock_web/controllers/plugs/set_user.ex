defmodule BandstockWeb.Plugs.SetUser do
	import Plug.Conn

	alias Bandstock.Repo
	alias Bandstock.Account.User

	def init(_params) do
		
	end

	def call(conn, _params) do
		user_id = get_session(conn, :user_id)

		cond do
			user = user_id && Repo.get(User, user_id) ->    #if user_id exists, then rs of && happens, gets user, then assigns result to user
				assign(conn, :user, user) #conn.assigns.user
			true ->
				assign(conn, :user, nil)
		end
	end
end