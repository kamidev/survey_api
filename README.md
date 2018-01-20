# SurveyAPI

This is a simple Elixir/Phoenix API for the Sharing Cites Survey web application. See: https://github.com/kamidev/survey_frontend. 

Phoenix 1.3 API generators were used to create this API. [This blog post](https://becoming-functional.com/building-a-rest-api-with-phoenix-1-3-part-1-9f8754aeaa87) gives a step-by-step description of how to use them. The official Phoenix documentation has a lot to say about [why and when you should use generators](https://hexdocs.pm/phoenix/contexts.html). TLDR: Don't rely on them without understanding what they do.
## Prerequisites

### Erlang and Elixir

The API is written in Elixir and depends on the Erlang/OTP runtime being installed. 

The current versions for this project can be found in the file `.tool-versions`. Make sure those versions are installed. We strongly recommend using the [asdf version manager](https://github.com/asdf-vm/asdf) to install and manage Erlang and Elixir. 

Check your installation by running the command `iex`. The result should be similar to this:

```shell
Erlang/OTP 20 [erts-9.1] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:10] [hipe] [kernel-poll:false]

Interactive Elixir (1.6.0) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)>
```

### Postgres

Postgres 9.6 or later must be installed. You also need a database user with permission to create databases. 

On a development machine it is very convenient to have a `postgres` user with password `postgres` (this is the default assumed by all Elixir projects). But definitely use something else in production.

### Phoenix

Make sure you have the latest version of Elixir and Erlang package managers.

```shell
mix local.hex
mix local.rebar
```

Install the latest version of Phoenix.

```shell
mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez
```

## Test installation on development machine

Clone this repository
```shell
  git clone https://github.com/kamidev/survey_api.git
  cd survey_ap
  ```
  Install dependencies
  ```shell
  mix deps.get
  ```
  Wipe the dev database clean and load some sample data
  ```shell
  mix ecto.reset
  ```
 Start the Phoenix server
 ```shell
 iex -S mix phx.server
```

Now visit the API endpoints with your browser:

[`localhost:4000/api/surveys`](http://localhost:4000/api/surveys)

[`localhost:4000/api/users`](http://localhost:4000/api/users)

[`localhost:4000/api/answers`](http://localhost:4000/api/answers)

Surveys should return sample JSON data. The others should return `{"data":[]}`.

## Building releases and deploying

For production use, we build releases with [Distillery](https://github.com/bitwalker/distillery). 

The current strategy starts with installing Erlang and Elixir on the production server. By including the Erlang runtime binaries from the server, we can build releases both on the production server and on dev machines with different operation systems (other Ubuntu versions, CentOS, MacOS etc). There are lternatives, but they require a separate build server and/or Docker. 

The basic deployment procedure is described in detail here: 

[How to configure and deploy an Elixir app to a VPS](https://www.amberbit.com/blog/2017/7/17/deploy-elixir-app-to-a-vps/).

The `mix release` command builds a release. Before building, check the Erlang runtime settings in the file `rel/config.exs`. To use the Erlang runtime already installed on the target server, set `include_erts: false`.

Test your release on your dev machine:

```shell
MIX_ENV=dev mix ecto.reset
MIX_ENV=dev mix release
_build/dev/rel/survey_api/bin/survey_api start
```

Check that `localhost:4000/api/surveys` and the other endpoints work. When the release is good enough for production, commit and push the latest code.
## Deploying a new release to production

Before deploying in production, make sure there is a file called `config/prod.secret.exs`. This file is not under version control and is used for passwords and other sensitive data. See `config/prod.exs` for an example of what to put there. 

On the production server, check out the latest code, then use this to deploy a completely new release:

```shell
MIX_ENV=prod mix release
_build/prod/rel/survey_api/bin/survey_api start
```

Check that the release is up with `curl http://localhost:4001/api/surveys`. This should return JSON for some survey templates. All production endpoints are currently configured to run on `localhost:4001/api`. 

List available application commands with `_build/prod/rel/survey_api/bin/survey_api help` 

Note that the service does not automatically restart after a server reboot. This can be managed with a [systemd service](https://mfeckie.github.io/Phoenix-In-Production-With-Systemd/), a cron job or something similar.

WARNING! `mix ecto.reset` drops the database and sets up a sample survey. If real survey data is already in production, don't do that! Either create Ecto migrations for the production database or do it manually.


## Additional deployment resources 

Below are more resources about building and managing releases. It is good to read them before attempting to upgrade a production server.

[Mastering Elixir Releases with Distillery — A (Pretty) Complete Guide](https://hackernoon.com/mastering-elixir-releases-with-distillery-a-pretty-complete-guide-497546f298bc)

[Using Distillery With Phoenix](https://hexdocs.pm/distillery/use-with-phoenix.html)

[Official Phoenix deployment guides](http://www.phoenixframework.org/docs/deployment)

Note that we currently do no use Edeliver to fully automate the release process. For frequent updates or multiple servers, this is worth looking into.

[How To Automate Elixir-Phoenix Deployment with Distillery and edeliver on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-automate-elixir-phoenix-deployment-with-distillery-and-edeliver-on-ubuntu-16-04).


### Official Phoenix resources

  * Website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
