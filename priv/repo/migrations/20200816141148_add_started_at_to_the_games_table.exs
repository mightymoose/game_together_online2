defmodule GameTogetherOnline.Repo.Migrations.AddStartedAtToTheGamesTable do
  use Ecto.Migration

  def change do
    alter table(:games) do
      add :started_at, :utc_datetime_usec
    end
  end
end
