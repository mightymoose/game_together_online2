# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :game_together_online,
  ecto_repos: [GameTogetherOnline.Repo]

# Configures the endpoint
config :game_together_online, GameTogetherOnlineWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MaL3Bmc+z1TUuzeB9Puw+C/6Iav1N69HlMUv7kZ4YGz5/GKXfu7ncB4Ayc/KqX0W",
  render_errors: [view: GameTogetherOnlineWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: GameTogetherOnline.PubSub,
  live_view: [signing_salt: "6Eud2JpF"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
