defmodule GameTogetherOnline.Deals do
  alias GameTogetherOnline.Deals.Deal

  alias GameTogetherOnline.Hands

  def create(_attrs \\ {}) do
    %Deal{hands: create_hands()}
  end

  defp create_hands(), do: 0..3 |> Enum.map(fn _i -> Hands.create() end)
end
