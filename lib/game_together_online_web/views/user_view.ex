defmodule GameTogetherOnlineWeb.UserView do
  use GameTogetherOnlineWeb, :view

  def redirect_param(%{params: %{"redirect" => redirect}}), do: %{redirect: redirect}
  def redirect_param(_), do: %{}
end
