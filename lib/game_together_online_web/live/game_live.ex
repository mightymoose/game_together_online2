defmodule GameTogetherOnlineWeb.GameLive do
  use GameTogetherOnlineWeb, :live_view

  alias GameTogetherOnline.Deals
  alias GameTogetherOnline.Deals.Deal

  def mount(%{"game_id" => game_id}, %{"current_user_id" => _current_user_id}, socket) do
    {
      :ok,
      socket
      |> assign_new(:game_id, fn -> game_id end)
      |> assign_new(:deal, fn -> Deals.create() |> Deal.deal_cards() end)
    }
  end

  def mount(%{"game_id" => game_id}, _session, socket) do
    {:ok,
     redirect(socket,
       to: Routes.user_path(socket, :new, redirect: Routes.game_path(socket, :show, game_id))
     )}
  end
end
