# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     GameTogetherOnline.Repo.insert!(%GameTogetherOnline.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias GameTogetherOnline.Suits.Suit
alias GameTogetherOnline.Suits
alias GameTogetherOnline.Ranks.Rank
alias GameTogetherOnline.Ranks
alias GameTogetherOnline.Cards.Card
alias GameTogetherOnline.Repo
alias Ecto.Query

require Ecto.Query

suits = [
  [name: "Spades"],
  [name: "Clubs"],
  [name: "Hearts"],
  [name: "Diamonds"]
]

ranks = [
  [name: "Two"],
  [name: "Three"],
  [name: "Four"],
  [name: "Five"],
  [name: "Six"],
  [name: "Seven"],
  [name: "Eight"],
  [name: "Nine"],
  [name: "Ten"],
  [name: "Jack"],
  [name: "Queen"],
  [name: "King"],
  [name: "Ace"]
]

Enum.each(suits, fn suit_attrs ->
  suit_exists? =
    Suit
    |> Query.where(^suit_attrs)
    |> Repo.exists?()

  if !suit_exists? do
    Repo.insert_all(Suit, [
      suit_attrs ++ [inserted_at: DateTime.utc_now(), updated_at: DateTime.utc_now()]
    ])
  end
end)

Enum.each(ranks, fn rank_attrs ->
  rank_exists? =
    Rank
    |> Query.where(^rank_attrs)
    |> Repo.exists?()

  if !rank_exists? do
    Repo.insert_all(Rank, [
      rank_attrs ++ [inserted_at: DateTime.utc_now(), updated_at: DateTime.utc_now()]
    ])
  end
end)

for rank <- Ranks.list_ranks(), suit <- Suits.list_suits() do
  rank_id = rank.id
  suit_id = suit.id

  card_exists? =
    Card
    |> Query.where(rank_id: ^rank_id, suit_id: ^suit_id)
    |> Repo.exists?()

  if !card_exists? do
    Repo.insert_all(Card, [
      [
        rank_id: rank_id,
        suit_id: suit_id,
        inserted_at: DateTime.utc_now(),
        updated_at: DateTime.utc_now()
      ]
    ])
  end
end
