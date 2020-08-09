defmodule GameTogetherOnline.Repo.Migrations.EnableTheUuidOsspExtension do
  use Ecto.Migration

  def change do
    execute(
      "CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\"",
      "DROP EXTENSION IF EXISTS \"uuid-ossp\""
    )
  end
end
