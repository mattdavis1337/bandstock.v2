defmodule Bandstock.Repo.Migrations.AddFieldsToCards do
  use Ecto.Migration


  def change do
    create table(:cards_boards) do
      add :card_id, references(:cards)
      add :board_id, references(:boards)
    end

    create unique_index(:cards_boards, [:card_id, :board_id])
  end
end
