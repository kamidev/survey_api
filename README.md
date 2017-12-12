# SurveyAPI

To test locally:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.reset`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit the endpoints sith your browser.

[`localhost:4000/api/surveys`](http://localhost:4000/api/surveys)

[`localhost:4000/api/users`](http://localhost:4000/api/users)

[`localhost:4000/api/answers`](http://localhost:4000/api/answers)

For production use, the project is configured to build a release with Distillery. The current strategy is to build a release on the production server and run on localhost:4001. 

Please [check the official deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
