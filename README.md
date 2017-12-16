# SurveyAPI


## Install locally and test

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.reset`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit the endpoints with your browser.

[`localhost:4000/api/surveys`](http://localhost:4000/api/surveys)

[`localhost:4000/api/users`](http://localhost:4000/api/users)

[`localhost:4000/api/answers`](http://localhost:4000/api/answers)

## Deployment

For production use, the project is configured to build releases with Distillery. Our current strategy is to install Erlang on the production server and immediately download the resulting runtime binaries to our development machine. This makes it possible to build and test releases both on the production server and on development machines. This also guarantees we won't run into problems if dev prod and dev machines use different operation systems (for instance older versions of Ubuntu, other Linuxes or MacOS). 

Before deploying, make sure there is a file called `config/prod.secret.exs`. This file should not be not under version control, and is used to store sensitive production values, such as the database login. See `config/prod.secret.exs` for detailed info about what should go there. 

The basic deployment procedure is described in detail here: 

[How to configure and deploy an Elixir app to a VPS](https://www.amberbit.com/blog/2017/7/17/deploy-elixir-app-to-a-vps/).


To build a release, run this in a terminal on your development machine.

```shell
MIX_ENV=dev mix release
```
Then follow the instructions and test your release. If that works, do this on the server

```shell
MIX_ENV=dev mix release
_build/prod/rel/survey_api/bin/survey_api start
```
Your service should now be up and running on the configured port (currently: localhost:4001). Note that it does not go up automatically after a server reboot, this must be setup manually.

WARNING! Database migrations are handled automatically on a new release. Currently, they are setup to clean and re-install the database with sample data. Once there is survey data in production, this must be changed.

## Additional deployment resources 

Below is more info about building releases. Note that we currently don't use Edeliver to fully automate the release process.

[Using Distillery With Phoenix](https://hexdocs.pm/distillery/use-with-phoenix.html)

[How To Automate Elixir-Phoenix Deployment with Distillery and edeliver on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-automate-elixir-phoenix-deployment-with-distillery-and-edeliver-on-ubuntu-16-04).

[The official Phoenix deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more about Phoenix

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
