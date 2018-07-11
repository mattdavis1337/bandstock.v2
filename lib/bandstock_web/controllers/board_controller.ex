defmodule BandstockWeb.BoardController do
  use BandstockWeb, :controller

  alias Bandstock.Game
  alias Bandstock.Game.Board
  alias Bandstock.Game.Card

  #action_fallback BandstockWeb.FallbackController

  def index(conn, _params) do
    boards = Game.list_boards()
    render(conn, "index.json", boards: boards)
  end

  def create(conn, %{"board" => board_params}) do
    with {:ok, %Board{} = board} <- Game.create_board(board_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", board_path(conn, :show, board))
      |> render("show.json", board: board)
    end
  end

  def show(conn, %{"id" => id}) do
    board = Game.get_board!(id)
    render(conn, "show.json", board: board)
  end

  def update(conn, %{"id" => id, "board" => board_params}) do
    board = Game.get_board!(id)

    with {:ok, %Board{} = board} <- Game.update_board(board, board_params) do
      render(conn, "show.json", board: board)
    end
  end

  def delete(conn, %{"id" => id}) do
    board = Game.get_board!(id)
    with {:ok, %Board{}} <- Game.delete_board(board) do
      send_resp(conn, :no_content, "")
    end
  end

  def link(conn, %{}) do
    {:ok, %Board{} = board1} = Game.create_board(%{hash: random_string(16), name: "name " <> random_string(16), image: "image" <> random_string(16)})
    {:ok, %Card{} = card1} = Game.create_card(%{hash: random_string(16), name: "name " <> random_string(16), image: "image" <> random_string(16)})

    {:ok, card_board} = Game.link_card_and_board(card1, board1)

    render(conn, "show.json", board: card_board)
  end

  defp random_string(length) do
    :crypto.strong_rand_bytes(length) |> Base.url_encode64 |> binary_part(0, length)
  end
end
