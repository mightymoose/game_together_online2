defmodule GameTogetherOnline.Factory do
  use ExMachina.Ecto, repo: GameTogetherOnline.Repo

  alias GameTogetherOnline.Users.User
  alias GameTogetherOnline.Games.Game

  def user_factory do
    %User{
      username: sequence(:username, &"username-#{&1}")
    }
  end

  def game_factory do
    %Game{}
  end
end
