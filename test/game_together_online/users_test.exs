defmodule GameTogetherOnline.UsersTest do
  use GameTogetherOnline.DataCase

  alias GameTogetherOnline.Repo
  alias GameTogetherOnline.Factory
  alias GameTogetherOnline.Users
  alias GameTogetherOnline.Users.User

  test "create_user/1 with valid data creates a user" do
    params = Factory.params_for(:user)
    {:ok, user} = Users.create_user(params)

    assert [user] == Repo.all(User)
    assert(user.username == params[:username])
  end

  test "create_user/1 with invalid data returns an error changeset" do
    params = Factory.params_for(:user, username: nil)
    assert {:error, %Ecto.Changeset{}} = Users.create_user(params)
    assert [] == Repo.all(User)
  end

  test "update_user/2 with valid data updates the user" do
    user = Factory.insert(:user)
    params = Factory.params_for(:user)

    {:ok, updated_user} = Users.update_user(user, params)

    assert updated_user == Repo.get(User, updated_user.id)
    assert updated_user.username == params[:username]
  end

  test "update_user/2 with invalid data returns an error changeset" do
    user = Factory.insert(:user)
    params = Factory.params_for(:user, username: "")

    {:error, %Ecto.Changeset{}} = Users.update_user(user, params)

    assert user == Repo.get(User, user.id)
  end

  test "get_user/1 returns the user with the given id" do
    user = Factory.insert(:user)
    assert Users.get_user!(user.id) == user
  end
end
