defmodule Bandstock.Repo.Migrations.UpdateTileTable do
  use Ecto.Migration

  def change do
    alter table(:tiles) do
      add :loc_x, :integer
      add :loc_y, :integer
      add :size_x, :integer
      add :size_y, :integer
      remove :location
    end
  end
end
