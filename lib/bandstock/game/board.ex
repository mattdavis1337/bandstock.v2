defmodule Bandstock.Game.Board do
  use Ecto.Schema
  import Ecto.Changeset


  schema "boards" do
    field :hash, :string
    field :name, :string
    many_to_many :cards, Bandstock.Game.Card, join_through: "cards_boards"
    timestamps()
  end

  @doc false
  def changeset(board, attrs) do
    board
    |> cast(attrs, [:name, :hash])
    |> validate_required([:name, :hash])
  end
end
