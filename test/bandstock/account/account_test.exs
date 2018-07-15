defmodule Bandstock.AccountTest do
  use Bandstock.DataCase

  alias Bandstock.Account

  describe "users" do
    alias Bandstock.Account.User

    @valid_attrs %{email: "some email", handle: "some handle", provider: "some provider", token: "some token"}
    @update_attrs %{email: "some updated email", handle: "some updated handle", provider: "some updated provider", token: "some updated token"}
    @invalid_attrs %{email: nil, handle: nil, provider: nil, token: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_user()

      user
    end


    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Account.get_user!(user.id) == user
    end

  end
end
