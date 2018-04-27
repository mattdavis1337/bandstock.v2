defmodule BandstockWeb.Plugs.CheckRegistration do
	import Plug.Conn

	alias Bandstock.Repo
	alias Bandstock.Account.User

	def init(_params) do

	end

	def call(conn, _params) do
		#user_id = get_session(conn, :user_id)
    #tasks? = get_session(conn, :tasks_present)
    #if user_id && tasks?

		#cond do
		#	user_id && tasks?
		#end
	end
end
