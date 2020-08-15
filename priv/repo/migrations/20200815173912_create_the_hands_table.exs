defmodule GameTogetherOnline.Repo.Migrations.CreateTheHandsTable do
  use Ecto.Migration

  def change do
    create table(:hands, primary_key: false) do
      add :id, :binary_id, primary_key: true, default: fragment("uuid_generate_v4()")
      add :deal_id, references(:deals, type: :binary_id)

      timestamps(type: :utc_datetime_usec)
    end
  end
end
