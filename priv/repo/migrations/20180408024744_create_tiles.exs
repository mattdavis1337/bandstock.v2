defmodule Bandstock.Repo.Migrations.CreateTiles do
  use Ecto.Migration

  def change do
    create table(:tiles) do
      add :hash, :string
      add :location, :string
      add :image, :string

      timestamps()
    end

  end
end
