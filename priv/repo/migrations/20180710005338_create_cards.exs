defmodule Bandstock.Repo.Migrations.CreateCards do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add :hash, :string
      add :name, :string
      add :image, :string

      timestamps()
    end

    create unique_index(:cards, [:hash])
  end
end
