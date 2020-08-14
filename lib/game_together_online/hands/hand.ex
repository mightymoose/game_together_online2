defmodule GameTogetherOnline.Hands.Hand do
  use Ecto.Schema

  alias __MODULE__

  embedded_schema do
    field :cards
  end

  def add_card(%Hand{cards: cards}, card), do: %Hand{cards: [card | cards]}
end
