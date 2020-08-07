defmodule GameTogetherOnline.Users do
  alias GameTogetherOnline.Repo
  alias GameTogetherOnline.Users.User

  def create_user(attrs \\ %{}),
    do:
      %User{}
      |> User.changeset(attrs)
      |> Repo.insert()

  def update_user(user, attrs \\ %{}),
    do:
      user
      |> User.changeset(attrs)
      |> Repo.update()

  def get_user!(id), do: Repo.get!(User, id)
end
