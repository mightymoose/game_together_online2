defmodule GameTogetherOnlineWeb.UserControllerTest do
  use GameTogetherOnlineWeb.ConnCase

  alias GameTogetherOnline.Factory
  alias GameTogetherOnline.Repo
  alias GameTogetherOnline.Users.User

  describe "new user" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.user_path(conn, :new))
      assert html_response(conn, 200) =~ "Create A Game"
    end
  end

  describe "edit user" do
    test "renders form for editing chosen user", %{conn: conn} do
      user = Factory.insert(:user)
      conn = get(conn, Routes.user_path(conn, :edit, user))

      assert html_response(conn, 200) =~ "Create A Game"
      assert html_response(conn, 200) =~ "value=\"#{user.username}\""
    end
  end

  describe "create user" do
    test "redirects when data is valid", %{conn: conn} do
      attrs = Factory.params_for(:user)
      conn = post(conn, Routes.user_path(conn, :create), user: attrs)

      assert redirected_to(conn) == Routes.game_path(conn, :index)
    end

    test "creates a session when data is valid", %{conn: conn} do
      attrs = Factory.params_for(:user)
      conn = post(conn, Routes.user_path(conn, :create), user: attrs)

      [%{id: id}] = Repo.all(User)
      assert get_session(conn, :current_user_id) == id
    end

    test "renders errors when data is invalid", %{conn: conn} do
      attrs = Factory.params_for(:user, username: "")
      conn = post(conn, Routes.user_path(conn, :create), user: attrs)

      assert html_response(conn, 200) =~ "Create A Game"
    end

    test "does not create a session when data is invalid", %{conn: conn} do
      attrs = Factory.params_for(:user, username: "")
      conn = post(conn, Routes.user_path(conn, :create), user: attrs)

      assert get_session(conn, :current_user_id) == nil
    end
  end

  describe "update user" do
    test "redirects when data is valid", %{conn: conn} do
      user = Factory.insert(:user)
      attrs = Factory.params_for(:user)

      conn = put(conn, Routes.user_path(conn, :update, user), user: attrs)
      assert redirected_to(conn) == Routes.game_path(conn, :index)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      user = Factory.insert(:user)
      attrs = Factory.params_for(:user, username: "")

      conn = put(conn, Routes.user_path(conn, :update, user), user: attrs)
      assert html_response(conn, 200) =~ "Create A Game"
    end
  end
end
