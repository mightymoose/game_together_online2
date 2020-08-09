defmodule GameTogetherOnline.Users.UserTest do
  use GameTogetherOnline.DataCase

  alias GameTogetherOnline.Users.User
  alias GameTogetherOnline.Factory

  test "username is required" do
    params = Factory.params_for(:user, username: nil)
    changeset = User.changeset(%User{}, params)

    assert changeset.errors[:username] == {"can't be blank", [validation: :required]}
  end
end
