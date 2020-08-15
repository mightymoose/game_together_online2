defmodule GameTogetherOnline.Repo.Migrations.CreateTheCardsTable do
  use Ecto.Migration

  def change do
    create table(:cards, primary_key: false) do
      add :id, :binary_id, primary_key: true, default: fragment("uuid_generate_v4()")

      add :rank_id, references(:ranks, type: :binary_id)
      add :suit_id, references(:suits, type: :binary_id)

      timestamps(type: :utc_datetime_usec)
    end
  end
end
