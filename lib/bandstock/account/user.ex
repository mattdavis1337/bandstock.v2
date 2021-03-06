defmodule Bandstock.Account.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :handle, :string
    field :provider, :string
    field :token, :string
    field :admin, :boolean
    timestamps()
  end

  @doc false
  def changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, [:handle, :email, :provider, :token])
    |> validate_required([:email, :provider, :token])
  end
end
