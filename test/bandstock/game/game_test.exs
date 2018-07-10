defmodule Bandstock.GameTest do
  use Bandstock.DataCase

  alias Bandstock.Game


  describe "cards" do
    #alias Bandstock.Game.Card

    @valid_attrs %{hash: "some hash", image: "some image", name: "some name"}
    #@update_attrs %{hash: "some updated hash", image: "some updated image", name: "some updated name"}
    #@invalid_attrs %{hash: nil, image: nil, location: nil}

    test "list_cards/0 returns all cards" do
      card = card_fixture()
      assert Game.list_cards() == [card]
    end

    test "get_card_by_hash/1 returns correct card" do
      card = card_fixture()
      assert Game.get_card_by_hash(card.hash) != nil
    end

    defp card_fixture(attrs \\ %{}) do
      {:ok, card} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Game.create_card()
      card
    end

    # test "list_tiles/0 returns all tiles" do
    #   tile = tile_fixture()
    #   assert Game.list_tiles() == [tile]
    # end
    #
    # test "get_tile!/1 returns the tile with given id" do
    #   tile = tile_fixture()
    #   assert Game.get_tile!(tile.id) == tile
    # end
    #
    # test "create_tile/1 with valid data creates a tile" do
    #   assert {:ok, %Tile{} = tile} = Game.create_tile(@valid_attrs)
    #   assert tile.hash == "some hash"
    #   assert tile.image == "some image"
    #   assert tile.location == "some location"
    # end
    #
    # test "create_tile/1 with invalid data returns error changeset" do
    #   assert {:error, %Ecto.Changeset{}} = Game.create_tile(@invalid_attrs)
    # end
    #
    # test "update_tile/2 with valid data updates the tile" do
    #   tile = tile_fixture()
    #   assert {:ok, tile} = Game.update_tile(tile, @update_attrs)
    #   assert %Tile{} = tile
    #   assert tile.hash == "some updated hash"
    #   assert tile.image == "some updated image"
    #   assert tile.location == "some updated location"
    # end
    #
    # test "update_tile/2 with invalid data returns error changeset" do
    #   tile = tile_fixture()
    #   assert {:error, %Ecto.Changeset{}} = Game.update_tile(tile, @invalid_attrs)
    #   assert tile == Game.get_tile!(tile.id)
    # end
    #
    # test "delete_tile/1 deletes the tile" do
    #   tile = tile_fixture()
    #   assert {:ok, %Tile{}} = Game.delete_tile(tile)
    #   assert_raise Ecto.NoResultsError, fn -> Game.get_tile!(tile.id) end
    # end
    #
    # test "change_tile/1 returns a tile changeset" do
    #   tile = tile_fixture()
    #   assert %Ecto.Changeset{} = Game.change_tile(tile)
    # end
  end
end
