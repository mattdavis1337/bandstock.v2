defmodule Bandstock.Game do
  @moduledoc """
  The Game context.
  """

  import Ecto.Query, warn: false
  alias Bandstock.Repo
  alias Bandstock.Game.Card


  def create_card(attrs \\ %{}) do
    %Card{}
    |> Card.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Returns the list of cards.
  ## Examples
      iex> cards()
      [%Tile{}, ...]
  """
  def list_cards do
    Repo.all(Card)
  end

  # @doc """
  # Returns a list of tiles sorted for heap sort
  # ## Examples
  #     iex> list_tiles()
  #     [%Tile{}, ...]
  # """
  # def do_heap do
  #   Repo.all(Tile)
  # end

  @doc """
  Gets a single card.
  ## Examples
      iex> get_card_by_hash("FA343)
      %Card{}
  """
  def get_card_by_hash(hash), do: Repo.get_by(Card, hash: hash)

  # @doc """
  # Creates a tile.
  # ## Examples
  #     iex> create_tile(%{field: value})
  #     {:ok, %Tile{}}
  #     iex> create_tile(%{field: bad_value})
  #     {:error, %Ecto.Changeset{}}
  # """
  # def create_tile(attrs \\ %{}) do
  #   %Tile{}
  #   |> Tile.changeset(attrs)
  #   |> Repo.insert()
  # end
  #
  # @doc """
  # Updates a tile.
  # ## Examples
  #     iex> update_tile(tile, %{field: new_value})
  #     {:ok, %Tile{}}
  #     iex> update_tile(tile, %{field: bad_value})
  #     {:error, %Ecto.Changeset{}}
  # """
  # def update_tile(%Tile{} = tile, attrs) do
  #   tile
  #   |> Tile.changeset(attrs)
  #   |> Repo.update()
  # end
  #
  # @doc """
  # Deletes a Tile.
  # ## Examples
  #     iex> delete_tile(tile)
  #     {:ok, %Tile{}}
  #     iex> delete_tile(tile)
  #     {:error, %Ecto.Changeset{}}
  # """
  # def delete_tile(%Tile{} = tile) do
  #   Repo.delete(tile)
  # end
  #
  # @doc """
  # Returns an `%Ecto.Changeset{}` for tracking tile changes.
  # ## Examples
  #     iex> change_tile(tile)
  #     %Ecto.Changeset{source: %Tile{}}
  # """
  # def change_tile(%Tile{} = tile) do
  #   Tile.changeset(tile, %{})
  # end

end
