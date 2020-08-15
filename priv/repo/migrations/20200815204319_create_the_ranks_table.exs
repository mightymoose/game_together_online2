defmodule GameTogetherOnline.Repo.Migrations.CreateTheRanksTable do
  use Ecto.Migration

  def change do
    create table(:ranks, primary_key: false) do
      add :id, :binary_id, primary_key: true, default: fragment("uuid_generate_v4()")
      add :name, :string, null: false

      timestamps(type: :utc_datetime_usec)
    end
  end
end
