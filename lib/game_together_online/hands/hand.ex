defmodule GameTogetherOnline.Hands.Hand do
  use Ecto.Schema
  import Ecto.Changeset

  alias GameTogetherOnline.Deals.Deal
  alias GameTogetherOnline.DeltCards.DeltCard

  @primary_key {:id, :binary_id, read_after_writes: true}
  @foreign_key_type :binary_id

  schema "hands" do
    field :hand_number, :integer

    belongs_to :deal, Deal
    has_many :delt_cards, DeltCard

    timestamps(type: :utc_datetime_usec)
  end

  def changeset(hand, attrs \\ %{}) do
    hand
    |> cast(attrs, [:deal_id, :hand_number])
    |> validate_required([:deal_id, :hand_number])
    |> foreign_key_constraint(:deal_id)
  end
end
