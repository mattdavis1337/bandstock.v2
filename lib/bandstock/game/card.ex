defmodule Bandstock.Game.Card do
  use Ecto.Schema
  import Ecto.Changeset


  schema "cards" do
    field :hash, :string
    field :image, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, [:hash, :name, :image])
    |> validate_required([:hash, :name, :image])
    |> unique_constraint(:hash)
  end
end
