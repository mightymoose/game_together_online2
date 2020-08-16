defmodule GameTogetherOnlineWeb.GameLive do
  use GameTogetherOnlineWeb, :live_view
  require Ecto.Query

  alias Ecto.Query
  alias GameTogetherOnline.Repo
  alias GameTogetherOnline.Deals.Deal

  def mount(%{"game_id" => game_id}, %{"current_user_id" => _current_user_id}, socket) do
    {
      :ok,
      socket
      |> assign_new(:game_id, fn -> game_id end)
      |> assign_new(:deal, fn -> load_deal(game_id) end)
    }
  end

  def mount(%{"game_id" => game_id}, _session, socket) do
    {:ok,
     redirect(socket,
       to: Routes.user_path(socket, :new, redirect: Routes.game_path(socket, :show, game_id))
     )}
  end

  defp load_deal(game_id) do
    Deal
    |> Query.where([deal], deal.game_id == ^game_id)
    |> Query.preload(hands: [delt_cards: [card: [:rank, :suit]]])
    |> Repo.one!()
  end
end
