defmodule GameTogetherOnlineWeb.GameLiveTest do
  use GameTogetherOnlineWeb.ConnCase

  import Phoenix.LiveViewTest

  describe "when there is a user in the session" do
    test "disconnected and connected render", %{conn: conn} do
      {:ok, page_live, disconnected_html} =
        conn
        |> Plug.Test.init_test_session(%{current_user_id: "user id"})
        |> live(Routes.game_path(conn, :show, "123"))

      assert disconnected_html =~ "Play the game here"
      assert render(page_live) =~ "Play the game here"
    end
  end

  describe "when there is no user in the session" do
    test "redirect to login page", %{conn: conn} do
      create_user_path =
        Routes.user_path(conn, :new, redirect: Routes.game_path(conn, :show, "123"))

      assert {:error, {:redirect, %{to: ^create_user_path}}} =
               live(conn, Routes.game_path(conn, :show, "123"))
    end
  end
end
