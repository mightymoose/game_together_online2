defmodule GameTogetherOnline.Cards do
  alias GameTogetherOnline.Repo
  alias GameTogetherOnline.Cards.Card

  import Ecto.Query

  def list_cards(),
    do:
      Card
      # TODO: Rip this join out :D
      |> preload([:rank, :suit])
      |> Repo.all()
end
