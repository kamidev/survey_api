Postgrex.Types.define(SurveyAPI.PostgresTypes, [], json: Jason)

## If using with ecto, you also need to pass ecto default extensions:

Postgrex.Types.define(SurveyAPI.PostgresTypes, [] ++ Ecto.Adapters.Postgres.extensions(),
  json: Jason
)
