defmodule GameTogetherOnline.Factory do
  use ExMachina.Ecto, repo: GameTogetherOnline.Repo

  alias GameTogetherOnline.Users.User

  def user_factory do
    %User{
      username: sequence(:username, &"username-#{&1}")
    }
  end
end
