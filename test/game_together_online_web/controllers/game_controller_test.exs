defmodule GameTogetherOnlineWeb.GameControllerTest do
  use GameTogetherOnlineWeb.ConnCase

  alias GameTogetherOnline.Factory

  describe "join game" do
    test "redirects to edit the user when there is a session", %{conn: conn} do
      user = Factory.insert(:user)

      assert conn
             |> Plug.Test.init_test_session(%{current_user_id: user.id})
             |> put_session(:current_user_id, user.id)
             |> get(Routes.game_path(conn, :join, "123"))
             |> redirected_to() ==
               Routes.user_path(conn, :edit, user.id,
                 redirect: Routes.game_path(conn, :show, "123")
               )
    end

    test "redirects to create a user when there is no session", %{conn: conn} do
      assert conn
             |> get(Routes.game_path(conn, :join, "456"))
             |> redirected_to() ==
               Routes.user_path(conn, :new, redirect: Routes.game_path(conn, :show, "456"))
    end
  end
end
