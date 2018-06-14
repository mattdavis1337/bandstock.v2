defmodule BandstockWeb.TileController do
  use BandstockWeb, :controller

  alias Bandstock.Game
  alias Bandstock.Game.Tile

  def index(conn, _params) do
    tiles = Game.list_tiles()
    render(conn, "index.html", tiles: tiles)
  end

  def heap(conn, _params) do
    tiles = Game.do_heap()
    render(conn, "heap.html", tiles: tiles)
  end

  def new(conn, _params) do
    changeset = Game.change_tile(%Tile{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"tile" => tile_params}) do
    case Game.create_tile(tile_params) do
      {:ok, tile} ->
        conn
        |> put_flash(:info, "Tile created successfully.")
        |> redirect(to: tile_path(conn, :show, tile))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    tile = Game.get_tile!(id)
    render(conn, "show.html", tile: tile)
  end

  def edit(conn, %{"id" => id}) do
    tile = Game.get_tile!(id)
    changeset = Game.change_tile(tile)
    render(conn, "edit.html", tile: tile, changeset: changeset)
  end

  def update(conn, %{"id" => id, "tile" => tile_params}) do
    tile = Game.get_tile!(id)

    case Game.update_tile(tile, tile_params) do
      {:ok, tile} ->
        conn
        |> put_flash(:info, "Tile updated successfully.")
        |> redirect(to: tile_path(conn, :show, tile))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", tile: tile, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    tile = Game.get_tile!(id)
    {:ok, _tile} = Game.delete_tile(tile)

    conn
    |> put_flash(:info, "Tile deleted successfully.")
    |> redirect(to: tile_path(conn, :index))
  end
end
