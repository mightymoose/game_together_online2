defmodule GameTogetherOnlineWeb.GameLiveTest do
  use GameTogetherOnlineWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/games/123")
    assert disconnected_html =~ "Play the game here"
    assert render(page_live) =~ "Play the game here"
  end
end
