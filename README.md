# SurveyAPI

This is the Elixir/Phoenix API for the Sharing Cites Survey web application. See: https://github.com/kamidev/survey_frontend. 

The starting point for this project was Phoenix 1.3 API generators. [This blog post](https://becoming-functional.com/building-a-rest-api-with-phoenix-1-3-part-1-9f8754aeaa87) gives a step-by-step description of how to use them. 

In the official Phoenix documentation there is an [interesting discusssion](https://hexdocs.pm/phoenix/contexts.html) about why and when you should use generators.

## Prerequisites

### Erlang and Elixir

The API is developed using Elixir and depends on the Erlang/OTP runtime being installed. 

For Sharing Cities, we use the [asdf version manager](https://github.com/asdf-vm/asdf) to install and manage Erlang and Elixir. The current versions for this project can be found in the file `.tool-versions`. Make sure you have those versions installed.

Check your installation by running the command `iex`. The result should be very similar to this
```shell
Erlang/OTP 20 [erts-9.1] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:10] [hipe] [kernel-poll:false]

Interactive Elixir (1.5.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)>
```

### Postgres

Make sure Postgres 9.6 or later is installed. 

You must have a database user with permission to create databases. On a development machine it is convenient to use the `postgres` user with password `postgres`, since this is the default used by all new Elixir projects.

For produktion use, this is dangerous and you should pick something else.

### Phoenix

Install the latest version of Phoenix.

```shell
mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez
```
Make sure you have the latest version of the Elixir package manager.

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

## Building releases and deploying

For production use, the project is configured to build releases with [Distillery](https://github.com/bitwalker/distillery). Our current strategy is to install Erlang on the production server and immediately download the resulting runtime binaries to our development machine. This makes it possible to build and test releases both on the production server and on development machines. This also guarantees we won't run into problems if dev prod and dev machines use different operation systems (for instance older versions of Ubuntu, other Linuxes or MacOS). 

The basic deployment procedure we use is described in detail here: 

[How to configure and deploy an Elixir app to a VPS](https://www.amberbit.com/blog/2017/7/17/deploy-elixir-app-to-a-vps/).

Before deploying, make sure there is a file called `config/prod.secret.exs`. This file should not be not under version control, and is used to store sensitive production values, such as the database login. See `config/prod.exs` for detailed info about what should go there. 

To build a release, use the `mix release` command. Before you do, make sure you have checked your `rel/config.exs` file and understand what runtime will be used for building. Then run this in a terminal on your development machine:

```shell
MIX_ENV=dev mix release
_build/dev/rel/survey_api/bin/survey_api start
MIX_ENV=dev mix ecto.reset
```
Follow the instructions and test your release. The development endpoints should be on `localhost:4000`. When the release is good enough for production, make sure the latest code is pushed to the server.

## Deploying a new release to production

Production endpoints are currently configured to run on `localhost:4001`. On the server, use this to deploy a completely new release:

```shell
MIX_ENV=prod mix release
_build/prod/rel/survey_api/bin/survey_api start
```
Note that the service does not come up automatically after a server reboot. Manage this the same way other services are managed on the production server.

WARNING! `mix ecto.reset` will drop the database and re-load the sample survey. If real survey data is already in production you should NOT do that. Instead, generate specific Ecto data migrations to update the database.

## Additional deployment resources 

Below are more resources about building and managing releases. You should read the first three before attempting to upgrade a production server.

[Mastering Elixir Releases with Distillery — A (Pretty) Complete Guide](https://hackernoon.com/mastering-elixir-releases-with-distillery-a-pretty-complete-guide-497546f298bc)

[The official Phoenix deployment guides](http://www.phoenixframework.org/docs/deployment)

[Using Distillery With Phoenix](https://hexdocs.pm/distillery/use-with-phoenix.html)

Note that we currently do not use Edeliver to fully automate the release process. For frequent updates and/or multiple servers, this is worth looking into.

[How To Automate Elixir-Phoenix Deployment with Distillery and edeliver on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-automate-elixir-phoenix-deployment-with-distillery-and-edeliver-on-ubuntu-16-04).


### Official Phoenix resources

  * Website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
