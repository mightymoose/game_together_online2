defmodule GameTogetherOnline.Repo.Migrations.CreateTheDeltCardsTable do
  use Ecto.Migration

  def change do
    create table(:delt_cards, primary_key: false) do
      add :id, :binary_id, primary_key: true, default: fragment("uuid_generate_v4()")

      add :card_id, references(:cards, type: :binary_id)
      add :hand_id, references(:hands, type: :binary_id)

      timestamps(type: :utc_datetime_usec)
    end
  end
end
