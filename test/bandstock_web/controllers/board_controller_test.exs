defmodule BandstockWeb.BoardControllerTest do
  use BandstockWeb.ConnCase

  alias Bandstock.Game
  alias Bandstock.Game.Board
  #alias BandstockWeb.BoardController

  @create_attrs %{hash: "some hash", name: "some name"}
  @update_attrs %{hash: "some updated hash", name: "some updated name"}
  @invalid_attrs %{hash: nil, name: nil}

  def fixture(:board) do
    {:ok, board} = Game.create_board(@create_attrs)
    board
  end

  
end
