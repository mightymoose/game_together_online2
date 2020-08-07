defmodule GameTogetherOnline.Repo.Migrations.CreateTheUsersTable do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true, default: fragment("uuid_generate_v4()")
      add :username, :string

      timestamps(type: :utc_datetime_usec)
    end
  end
end
