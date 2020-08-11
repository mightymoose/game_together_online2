defmodule GameTogetherOnlineWeb.GameLive do
  use GameTogetherOnlineWeb, :live_view

  def mount(%{"game_id" => game_id}, _session, socket) do
    {:ok, assign_new(socket, :game_id, fn -> game_id end)}
  end
end
