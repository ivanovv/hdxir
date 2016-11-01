# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
#config :hdxir,
#  ecto_repos: [Hdxir.Repo]

# Configures the endpoint
config :hdxir, Hdxir.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nLcsLkJoQ8LyM7RhmcGACACVNMeE35hrVCdNa6JQU/8GEaA8PakLFot6X+TVDIAD",
  render_errors: [view: Hdxir.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Hdxir.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
