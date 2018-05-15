defmodule BandstockWeb.Plugs.SetUser do
	import Plug.Conn
	import Phoenix.Controller

	alias Bandstock.Repo
	alias Bandstock.Account.User
	alias BandstockWeb.Router.Helpers

	def init(_params) do

	end

	def call(conn, _params) do
		IO.puts("++in set_user!+++")

		user_id = get_session(conn, :user_id)
		IO.puts("user_id:")
		IO.inspect(user_id)

		cond do
			user = user_id && Repo.get(User, user_id) ->    #if user_id exists, then rs of && happens, gets user, then assigns result to user
				IO.puts("++set_user 1")
				conn = assign(conn, :user, user) #conn.assigns.user
				if user.handle == nil do
					IO.puts("+++user handle nil redirecting+++")
					conn
					|> redirect(to: Helpers.user_path(conn, :update_handle))
					|> halt()
				end
				conn
			true ->
				IO.puts("++set_user 2")
				IO.inspect(:user)
				assign(conn, :user, nil)
		end
	end
end
