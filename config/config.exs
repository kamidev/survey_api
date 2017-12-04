# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :survey_api,
  namespace: SurveyAPI,
  ecto_repos: [SurveyAPI.Repo]

# Configures the endpoint
config :survey_api, SurveyAPIWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zysGjxU1cPARue69flssir0I0UZsQTaU9h/0Apd+SB6E7/fzRh1O33Q+9DkxOVxt",
  render_errors: [view: SurveyAPIWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: SurveyAPI.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
