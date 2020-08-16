defmodule GameTogetherOnline.Repo.Migrations.AddHandNumberToTheHandsTable do
  use Ecto.Migration

  def change do
    alter table(:hands) do
      add :hand_number, :integer
    end
  end
end
