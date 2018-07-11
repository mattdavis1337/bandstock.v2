defmodule Bandstock.Game do
  @moduledoc """
  The Game context.
  """

  import Ecto.Query, warn: false
  alias Bandstock.Repo
  alias Bandstock.Game.Card

  @doc """
  Creates a card.
  ## Examples
      iex> create_card(%{field: value})
      {:ok, %Card{}}
      iex> create_card(%{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
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

  @doc """
  Gets a single card by id.
  ## Examples
      iex> get_card_by_hash("FA343)
      %Card{}
  """
  def get_card!(id) do
    Repo.get!(Card, id)
  end

  @doc """
  Updates a card.
  ## Examples
      iex> card(card, %{field: new_value})
      {:ok, %Card{}}
      iex> update_card(tile, %{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def update_card(%Card{} = card, attrs) do
    card
    |> Card.changeset(attrs)
    |> Repo.update()
  end
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


  alias Bandstock.Game.Board

  @doc """
  Returns the list of boards.

  ## Examples

      iex> list_boards()
      [%Board{}, ...]

  """
  def list_boards do
    Repo.all(Board)
  end

  @doc """
  Gets a single board by hash.
  ## Examples
      iex> get_card_by_hash("FA343)
      %Card{}
  """
  def get_board_by_hash(hash), do: Repo.get_by(Board, hash: hash)

  @doc """
  Gets a single board.

  Raises `Ecto.NoResultsError` if the Board does not exist.

  ## Examples

      iex> get_board!(123)
      %Board{}

      iex> get_board!(456)
      ** (Ecto.NoResultsError)

  """
  def get_board!(id), do: Repo.get!(Board, id)

  @doc """
  Creates a board.

  ## Examples

      iex> create_board(%{field: value})
      {:ok, %Board{}}

      iex> create_board(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_board(attrs \\ %{}) do
    %Board{}
    |> Board.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a board.

  ## Examples

      iex> update_board(board, %{field: new_value})
      {:ok, %Board{}}

      iex> update_board(board, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_board(%Board{} = board, attrs) do
    board
    |> Board.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Board.

  ## Examples

      iex> delete_board(board)
      {:ok, %Board{}}

      iex> delete_board(board)
      {:error, %Ecto.Changeset{}}

  """
  def delete_board(%Board{} = board) do
    Repo.delete(board)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking board changes.

  ## Examples

      iex> change_board(board)
      %Ecto.Changeset{source: %Board{}}

  """
  def change_board(%Board{} = board) do
    Board.changeset(board, %{})
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking board changes.

  ## Examples

      iex> change_board(board)
      %Ecto.Changeset{source: %Board{}}

  """
  def link_card_and_board(card = %Card{}, board = %Board{}) do

    board = Repo.preload(board, :cards)
    cards = board.cards ++ [card]
                |> Enum.map(&Ecto.Changeset.change/1)

    board
    |> Ecto.Changeset.change
    |> Ecto.Changeset.put_assoc(:cards, cards)
    |> Repo.update

  end

  def unlink_card_and_board(card = %Card{}, board = %Board{}) do

    board = Repo.preload(board, :cards)
    cards = board.cards ++ [card]
                |> Enum.map(&Ecto.Changeset.change/1)

    board
    |> Ecto.Changeset.change
    |> Ecto.Changeset.put_assoc(:cards, cards)
    |> Repo.update

  end
end
