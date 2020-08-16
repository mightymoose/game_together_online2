defmodule GameTogetherOnline.Deals.Deal do
  use Ecto.Schema
  import Ecto.Changeset
  require Ecto.Query

  alias GameTogetherOnline.Repo
  alias Ecto.Query
  alias GameTogetherOnline.Cards
  alias GameTogetherOnline.Hands.Hand
  alias GameTogetherOnline.Games.Game
  alias GameTogetherOnline.DeltCards

  @primary_key {:id, :binary_id, read_after_writes: true}
  @foreign_key_type :binary_id

  schema "deals" do
    belongs_to :game, Game
    has_many :hands, Hand

    timestamps(type: :utc_datetime_usec)
  end

  def deal_cards(deal) do
    Cards.list_cards()
    |> Enum.shuffle()
    |> Enum.with_index()
    |> Enum.reduce(deal, &add_to_hand/2)
  end

  def changeset(deal, attrs \\ %{}) do
    deal
    |> cast(attrs, [:game_id])
    |> validate_required([:game_id])
    |> foreign_key_constraint(:game_id)
  end

  defp add_to_hand({card, index}, %{id: deal_id} = deal) do
    hand_number = rem(index, 4)

    %{id: hand_id} =
      Hand
      |> Query.where(deal_id: ^deal_id, hand_number: ^hand_number)
      |> Repo.one!()

    DeltCards.create_delt_card(%{hand_id: hand_id, card_id: card.id})
    deal
  end
end
