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

Bandstock.Repo.delete_all Bandstock.Game.Card

Bandstock.Repo.insert!(%Bandstock.Game.Card{
  hash: "Hash AAAFFF000997",
  image: "Image AAAFFF000997",
  name: "Name AAAFFF000997"
})

Bandstock.Repo.insert!(%Bandstock.Game.Card{
  hash: "Hash AAAFFF000998",
  image: "Image AAAFFF000998",
  name: "Name AAAFFF000998"
})

Bandstock.Repo.insert!(%Bandstock.Game.Card{
  hash: "Hash AAAFFF000999",
  image: "Image AAAFFF000999",
  name: "Name AAAFFF000999"
})
