defmodule Bandstock.Game.Tile do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tiles" do
    field :hash, :string
    field :image, :string
    field :location, :string

    timestamps()
  end

  @doc false
  def changeset(tile, attrs) do
    tile
    |> cast(attrs, [:hash, :location, :image])
    |> validate_required([:hash, :location, :image])
  end
end
