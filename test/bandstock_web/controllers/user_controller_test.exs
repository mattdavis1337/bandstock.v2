defmodule BandstockWeb.UserControllerTest do
  use BandstockWeb.ConnCase

  alias Bandstock.Account

  @create_attrs %{email: "some email", handle: "some handle", provider: "some provider", token: "some token"}
  #@update_attrs %{email: "some updated email", handle: "some updated handle", provider: "some updated provider", token: "some updated token"}
  #@invalid_attrs %{email: nil, handle: nil, provider: nil, token: nil}

  def fixture(:user) do
    {:ok, user} = Account.create_user(@create_attrs)
    user
  end

  describe "register" do
    test "Register new user", %{conn: _conn} do
      #conn = get conn, auth_path(conn, :register, "facebook")
      #IO.puts("+authfacebook+")
      #IO.inspect(conn)
    end
  end

  # defp create_user(_) do
  #   user = fixture(:user)
  #   {:ok, user: user}
  # end
end
