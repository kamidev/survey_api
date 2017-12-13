# SurveyAPI



To test locally:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.reset`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit the endpoints with your browser.

[`localhost:4000/api/surveys`](http://localhost:4000/api/surveys)

[`localhost:4000/api/users`](http://localhost:4000/api/users)

[`localhost:4000/api/answers`](http://localhost:4000/api/answers)

For production use, the project is configured to build releases with Distillery.

The current strategy is to first install Erlang on the production server, copy the ERTS Erlang runtime files to a development server and build the release there. The resulting binaries then work in production. This process will be documented in greater detail.

Please [check the official deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
