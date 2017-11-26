# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :spitwrap,
  ecto_repos: [Spitwrap.Repo]

# Configures the endpoint
config :spitwrap, SpitwrapWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "CmCHTsFJLDjZmLFUS4ZeUE33zpvW2Z34OslucQlXWeMqQ20t1H5fqJel3Z8gDe1K",
  render_errors: [view: SpitwrapWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Spitwrap.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
