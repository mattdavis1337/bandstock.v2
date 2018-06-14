defmodule Bandstock.Game.Tile do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tiles" do
    field :hash, :string
    field :image, :string
    field :loc_x, :integer
    field :loc_y, :integer
    field :size_x, :integer
    field :size_y, :integer

    timestamps()
  end

  @doc false
  def changeset(tile, attrs) do
    tile
    |> cast(attrs, [:hash, :loc_x, :loc_y, :size_x, :size_y, :image ])
    |> validate_required([:hash, :loc_x, :loc_y, :size_x, :size_y, :image ])
  end
end
