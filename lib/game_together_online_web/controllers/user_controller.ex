defmodule GameTogetherOnlineWeb.UserController do
  use GameTogetherOnlineWeb, :controller

  alias GameTogetherOnline.Users.User
  alias GameTogetherOnline.Users

  def new(conn, _params), do: render(conn, "new.html", changeset: User.changeset(%User{}))

  def edit(conn, %{"id" => id}) do
    changeset =
      id
      |> Users.get_user!()
      |> User.changeset()

    render(conn, "edit.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params} = params) do
    case Users.create_user(user_params) do
      {:ok, user} ->
        conn
        |> add_current_user_to_session(user)
        |> redirect(to: redirect_url(conn, params))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def update(conn, %{"id" => id, "user" => user_params} = params) do
    user = Users.get_user!(id)

    case Users.update_user(user, user_params) do
      {:ok, user} ->
        conn
        |> add_current_user_to_session(user)
        |> redirect(to: redirect_url(conn, params))

      {:error, changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end

  defp redirect_url(_conn, %{"redirect" => redirect}), do: redirect
  defp redirect_url(conn, _params), do: Routes.game_path(conn, :index)

  defp add_current_user_to_session(conn, %{id: id}), do: put_session(conn, :current_user_id, id)
end
