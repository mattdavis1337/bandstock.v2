# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :bandstock,
  ecto_repos: [Bandstock.Repo]

  config :bandstock, BandstockWeb.Endpoint,
    url: [host: "localhost"],
    secret_key_base: "bw+axmSUPIxPMJX5vMeu0ni+UC463x28MqoKHNsOTuHvK3vKqL48Tyb+7iOM+J/+",
    render_errors: [view: BandstockWeb.ErrorView, accepts: ~w(html json)],
    pubsub: [name: Bandstock.PubSub,
             adapter: Phoenix.PubSub.PG2],
    http: [port: System.get_env("BS_PORT_HTTP")],
    https: [port: System.get_env("BS_PORT_HTTPS"),
            otp_app: :bandstock,
            keyfile: System.get_env("PRIVKEY_PEM"),
            certfile: System.get_env("FULLCHAIN_PEM")
            ],
    protocol_options: [
      max_header_name_length: 64,
      max_header_value_length: 8192,
      max_headers: 100,
      max_request_line_length: 8192
    ]


# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :ueberauth, Ueberauth,
	providers: [
    facebook: { Ueberauth.Strategy.Facebook, [] },
		github: {Ueberauth.Strategy.Github, []}
	]

#Live: Client ID
#bf6d89024d8d1331a9d8
#Client Secret
#43a61f5df173796603761c6068198af34a848f93
