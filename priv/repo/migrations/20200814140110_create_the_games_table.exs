defmodule GameTogetherOnline.Repo.Migrations.CreateTheGamesTable do
  use Ecto.Migration

  def change do
    create table(:games, primary_key: false) do
      add :id, :binary_id, primary_key: true, default: fragment("uuid_generate_v4()")

      timestamps(type: :utc_datetime_usec)
    end
  end
end
