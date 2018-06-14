# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Bandstock.Repo.insert!(%Bandstock.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Bandstock.Repo.delete_all Bandstock.Game.Tile

Bandstock.Repo.insert!(%Bandstock.Game.Tile{
  hash: "AAAFFF000997",
  image: "",
  loc_x: 0,
  loc_y: 0,
  size_x: 3,
  size_y: 4
})

Bandstock.Repo.insert!(%Bandstock.Game.Tile{
  hash: "AAAFFF000998",
  image: "",
  loc_x: 5,
  loc_y: 0,
  size_x: 3,
  size_y: 4
})

Bandstock.Repo.insert!(%Bandstock.Game.Tile{
  hash: "AAAFFF000999",
  image: "",
  loc_x: 5,
  loc_y: 5,
  size_x: 4,
  size_y: 5
})
