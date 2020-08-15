defmodule GameTogetherOnline.Hands.Hand do
  use Ecto.Schema
  import Ecto.Changeset

  alias GameTogetherOnline.Deals.Deal

  @primary_key {:id, :binary_id, read_after_writes: true}
  @foreign_key_type :binary_id

  alias __MODULE__

  schema "hands" do
    belongs_to :deal, Deal

    field :cards, :any, virtual: true

    timestamps(type: :utc_datetime_usec)
  end

  def changeset(hand, attrs \\ %{}) do
    hand
    |> cast(attrs, [:deal_id])
    |> validate_required([:deal_id])
    |> foreign_key_constraint(:deal_id)
  end

  def add_card(%Hand{cards: cards}, card), do: %Hand{cards: [card | cards]}
end
