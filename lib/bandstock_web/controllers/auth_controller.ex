defmodule BandstockWeb.AuthController do
	use BandstockWeb, :controller
	plug Ueberauth

	alias Bandstock.Account.User
	alias Bandstock.Repo
	#alias Ueberauth.Strategy.Helpers
	#alias Bandstock.Conversation.ConversationServer

	#handle information that comes back from authenticating site
	def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do

		IO.puts("+++++auth callback++++");
		user_params = %{token: auth.credentials.token, email: auth.info.email, provider: "github"} #TODO change to provider from params
		#TODO add handle code , handle: Map.get(get_session(conn, :user_params), "handle")

		changeset = User.changeset(%User{}, user_params)

		IO.inspect(user_params)

		signin(conn, changeset)
	end

	def signout(conn, _params) do
		IO.puts("In Signout+++++")

		conn
		|> configure_session(drop: true)
		|> redirect(to: homepath(conn))
	end


	defp homepath(conn) do
		IO.puts("homepath++++")
		page_path(conn, :index)
	end

	#defp register_path(conn) do
	#	user_path(conn, :register)
	#end

	defp signin(conn, changeset) do
		case insert_or_update_user(conn, changeset) do
			{:ok, user} ->
				IO.puts("+++auth welcome back")
				IO.inspect(user)
				conn
				|> put_flash(:info, "Welcome back!")
				|> put_session(:user_id, user.id)  #add user_id to session
				|> redirect(to: homepath(conn))
			{:error, _reason} ->
				IO.puts("+++auth error")
				conn
				|> put_flash(:error, "Error signing in")
				|> redirect(to: homepath(conn))
		end
	end

	defp insert_or_update_user(_conn, changeset) do
		case Repo.get_by(User, email: changeset.changes.email) do
			nil ->
				#IO.puts("++++redirecting in insert_or_update_user++++")
				#IO.inspect(register_path(conn))
				#redirect(conn, to: register_path(conn)) #collect additional info from user #MFD

				IO.puts("+++++insert user")
				#ConversationServer.start_conversation({:start})
				Repo.insert(changeset) #add new user
			user ->
				IO.puts("+++++return user")
				{:ok, user} #return existing user
		end
	end

	def register(conn, _params) do
		IO.puts("+++register+++")
		render(conn, "register.html", changeset: User.changeset(%User{}, %{}))
	end
end
