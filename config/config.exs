# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :bandstock,
  ecto_repos: [Bandstock.Repo]

# Configures the endpoint
config :bandstock, BandstockWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bw+axmSUPIxPMJX5vMeu0ni+UC463x28MqoKHNsOTuHvK3vKqL48Tyb+7iOM+J/+",
  render_errors: [view: BandstockWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Bandstock.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :ueberauth, Ueberauth,
	providers: [
		github: {Ueberauth.Strategy.Github, [] }
	]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
	client_id:  "f736033898bc3772c56b",
	client_secret: "e93fca992ef29643e106184e76fef57601da0aff"