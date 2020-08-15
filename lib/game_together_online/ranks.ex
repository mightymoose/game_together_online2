defmodule GameTogetherOnline.Ranks do
  alias GameTogetherOnline.Repo
  alias GameTogetherOnline.Ranks.Rank

  def list_ranks(), do: Repo.all(Rank)
end
