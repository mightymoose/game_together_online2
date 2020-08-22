defmodule GameTogetherOnline.Repo.Migrations.CreateSeatsTable do
  use Ecto.Migration

  def change do
    create table(:seats, primary_key: false) do
      add :id, :binary_id, primary_key: true, default: fragment("uuid_generate_v4()")
      add :seat_number, :integer
      add :name, :string

      timestamps(type: :utc_datetime_usec)
    end
  end
end
