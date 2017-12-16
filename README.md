# SurveyAPI

This is an API used by the Sharing Cites survey web application. See https://github.com/kamidev/survey_frontend. 

## Prerequisites

### Erlang and Elixir

The API is developed using Elixir and depends on the Erlang/OTP runtime being installed. 

For Sharing Citiesd, we use the [asdf version manager](https://github.com/asdf-vm/asdf) to manage Erlang and Elixir. The current versions are specified in the file `.tool-versions`.

Check your installation by running the command `iex`. The result should be very similar to this
```shell
Erlang/OTP 20 [erts-9.1] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:10] [hipe] [kernel-poll:false]

Interactive Elixir (1.5.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)>
```

### Postgres

Make sure Postgres 9.6 or later is installed. 

You must have a database user with permission to create databases. On a dev machine it is convenient to use the `postgres` user with password `postgres`. 

For produktion use, this is dangerous and you should pick something else.

### Phoenix

Install the latest version of Phoenix.

```shell
mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez
```
Install the latest version of the Elixir package manager.

```shell
mix local.hex
```

## Test installation on development machine

Clone this repository somewhere on your dev machine
```shell
  git clone https://github.com/kamidev/survey_api.git
  cd survey_api
  ```
  Install dependencies
  ```shell
  mix deps.get
  ```
  Wipe the dev database clean and load some sample data
  ```shell
  mix ecto.reset
  ```
 Start Phoenix endpoint with
 ```shell
 iex -S mix phx.server
```

Now visit the API endpoints with your browser:

[`localhost:4000/api/surveys`](http://localhost:4000/api/surveys)

[`localhost:4000/api/users`](http://localhost:4000/api/users)

[`localhost:4000/api/answers`](http://localhost:4000/api/answers)

Surveys should return sample JSON data. The others should return `{"data":[]}`.

## Deployment

For production use, the project is configured to build releases with Distillery. Our current strategy is to install Erlang on the production server and immediately download the resulting runtime binaries to our development machine. This makes it possible to build and test releases both on the production server and on development machines. This also guarantees we won't run into problems if dev prod and dev machines use different operation systems (for instance older versions of Ubuntu, other Linuxes or MacOS). 

Before deploying, make sure there is a file called `config/prod.secret.exs`. This file should not be not under version control, and is used to store sensitive production values, such as the database login. See `config/prod.exs` for detailed info about what should go there. 

The basic deployment procedure is described in detail here: 

[How to configure and deploy an Elixir app to a VPS](https://www.amberbit.com/blog/2017/7/17/deploy-elixir-app-to-a-vps/).


To build a release, use the `mix release` command. But before you do, make sure you have checked your `rel/config.exs` file and understand what's in it. 

Then run this in a terminal on your development machine.

```shell
MIX_ENV=dev mix release
```
Follow the instructions and test your release. 

```shell
_build/prod/rel/survey_api/bin/survey_api start
MIX_ENV=dev mix ecto.reset
```

When the release is good, make sure the latest code is on the server. Then release like this:

```shell
MIX_ENV=prod mix release
_build/prod/rel/survey_api/bin/survey_api start
MIX_ENV=prod mix ecto.reset
```
Your service endpoints should now be up and running on the configured production port (currently: localhost:4001). Note that the service does not come up automatically after a server reboot, this must be setup manually.

WARNING! Database migrations are currently setup to drop and re-load the database with sample data. Once there is actual survey data in production, this MUST be changed.

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
