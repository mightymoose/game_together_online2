defmodule GameTogetherOnlineWeb.UserViewTest do
  use GameTogetherOnlineWeb.ConnCase, async: true

  alias GameTogetherOnlineWeb.UserView

  describe "redirect_query_param" do
    test "returns the redirect param when there is one" do
      assert %{redirect: "redirect url"} ==
               UserView.redirect_param(%{params: %{"redirect" => "redirect url"}})
    end

    test "returns an empty object when there is no redirect param" do
      assert %{} == UserView.redirect_param(%{params: %{}})
    end
  end
end
