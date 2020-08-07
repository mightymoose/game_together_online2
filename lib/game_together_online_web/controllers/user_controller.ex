defmodule GameTogetherOnlineWeb.UserController do
  use GameTogetherOnlineWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end
end
