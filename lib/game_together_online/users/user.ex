defmodule GameTogetherOnline.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, read_after_writes: true}
  @foreign_key_type :binary_id

  schema "users" do
    field :username, :string

    timestamps(type: :utc_datetime_usec)
  end

  def changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, [:username])
    |> validate_required([:username])
  end
end
