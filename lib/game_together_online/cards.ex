defmodule GameTogetherOnline.Cards do
  alias GameTogetherOnline.Repo
  alias GameTogetherOnline.Cards.Card

  import Ecto.Query

  def list_cards(),
    do:
      Card
      |> preload([:rank, :suit])
      |> Repo.all()
end
