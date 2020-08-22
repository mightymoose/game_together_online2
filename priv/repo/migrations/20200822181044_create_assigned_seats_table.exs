defmodule GameTogetherOnline.Repo.Migrations.CreateAssignedSeatsTable do
  use Ecto.Migration

  def change do
    create table(:assigned_seats, primary_key: false) do
      add :id, :binary_id, primary_key: true, default: fragment("uuid_generate_v4()")

      add :seating_chart_id, references(:seating_charts, type: :binary_id)
      add :user_id, references(:users, type: :binary_id)

      timestamps(type: :utc_datetime_usec)
    end
  end
end
