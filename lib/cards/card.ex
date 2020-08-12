defmodule GameTogetherOnline.Cards.Card do
  use Ecto.Schema

  embedded_schema do
    field :suit
    field :rank
  end
end
