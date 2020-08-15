defmodule GameTogetherOnline.Factory do
  use ExMachina.Ecto, repo: GameTogetherOnline.Repo

  alias GameTogetherOnline.Users.User
  alias GameTogetherOnline.Games.Game
  alias GameTogetherOnline.Deals.Deal
  alias GameTogetherOnline.Hands.Hand

  def user_factory do
    %User{
      username: sequence(:username, &"username-#{&1}")
    }
  end

  def game_factory do
    %Game{}
  end

  def deal_factory do
    %{id: game_id} = insert(:game)

    %Deal{game_id: game_id}
  end

  def hand_factory do
    %{id: deal_id} = insert(:deal)

    %Hand{deal_id: deal_id}
  end
end
