defmodule BandstockWeb.UserController do
  use BandstockWeb, :controller

  alias Bandstock.Account
  alias Bandstock.Account.User

  plug BandstockWeb.Plugs.RequireAuth when action in[:new, :show, :edit, :update, :delete, :update_handle]

  def index(conn, _params) do
    users = Account.list_users()
    render(conn, "index.html", users: users)
  end

  def new(conn, _params) do
    changeset = Account.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Account.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: user_path(conn, :show, user))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def register(conn, %{"user" => user_params}) do
    IO.puts("+++ user register +++")
    IO.inspect(user_params)

    conn
    |> put_session(:user_params, user_params)  #add user_id to session
    |> redirect(to: auth_path(conn, :request, "github"))
  end

  def show(conn, %{"id" => id}) do
    user = Account.get_user!(id)
    render(conn, "show.html", user: user)
  end

  def edit(conn, %{"id" => id}) do
    user = Account.get_user!(id)
    changeset = Account.change_user(user)
    render(conn, "edit.html", user: user, changeset: changeset)
  end

  def update_handle(conn, params) do
    #%{"handle" => handle, "email" => email}

    user_id = get_session(conn, :user_id)
    user = user_id && Repo.get(User, user_id)
    IO.puts("+++update_handle+++")
    render(conn, "handle.html", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Account.get_user!(id)

    case Account.update_user(user, user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: user_path(conn, :show, user))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Account.get_user!(id)
    {:ok, _user} = Account.delete_user(user)

    conn
    |> put_flash(:info, "User deleted successfully.")
    |> redirect(to: user_path(conn, :index))
  end
end
