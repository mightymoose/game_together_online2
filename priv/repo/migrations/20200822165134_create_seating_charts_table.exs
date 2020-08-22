defmodule GameTogetherOnline.Repo.Migrations.CreateSeatingChartsTable do
  use Ecto.Migration

  def change do
    create table(:seating_charts, primary_key: false) do
      add :id, :binary_id, primary_key: true, default: fragment("uuid_generate_v4()")

      add :game_id, references(:games, type: :binary_id)
      add :seat_id, references(:seats, type: :binary_id)

      timestamps(type: :utc_datetime_usec)
    end
  end
end
