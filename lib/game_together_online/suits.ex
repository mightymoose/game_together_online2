defmodule GameTogetherOnline.Suits do
  alias GameTogetherOnline.Repo
  alias GameTogetherOnline.Suits.Suit

  def list_suits(), do: Repo.all(Suit)
end
