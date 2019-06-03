# SurveyAPI

Elixir/Phoenix API for Viablecities data gathering.

Phoenix API generators were used to create this API. [This blog post](https://becoming-functional.com/building-a-rest-api-with-phoenix-1-3-part-1-9f8754aeaa87) gives a step-by-step description of how to use them. The official Phoenix documentation has a lot to say about [when you should use generators](https://hexdocs.pm/phoenix/contexts.html). TLDR: Don't rely on them without understanding what they do.

## Prerequisites

### Erlang and Elixir

Elixir requires that the the Erlang/OTP runtime is installed.

Current language versions for this project are found in the file `.tool-versions`. Make sure the correct versions are installed. Using the [asdf version manager](https://github.com/asdf-vm/asdf) to install and manage Erlang and Elixir is highly recommended.

Check your installation by running the commandline shell `iex`. The result should be similar to this:

```survey_api git:(master) ✗ iex
Erlang/OTP 21 [erts-10.2.1] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe]

Interactive Elixir (1.8.0) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)>
```

### Postgres

Postgres 10 or later is required. There must be one database user with permissions to create databases.

On a development machine it is very convenient to have a `postgres` user with password `postgres` (because this is the default for new Elixir projects).

In production, datatabase login MUST be more secure. By convention, production login and other sensitive information is kept in a file named `prod.secret.exs`. For security reasons, this file should not be kept under version control.

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
## Automatic checking of source code dependencies

This project uses https://github.com/marketplace/dependabot-preview to check for updated dependencies. 
Pull requests are generated automatically.

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

````shell
mix ecto.reset
```a
Start the Phoenix server
```shell
iex -S mix phx.server
````

Now visit the API endpoints with your browser:

[`localhost:4000/api/surveys`](http://localhost:4000/api/surveys)

[`localhost:4000/api/users`](http://localhost:4000/api/users)

[`localhost:4000/api/answers`](http://localhost:4000/api/answers)

Surveys should return sample JSON data. The others should return `{"data":[]}`.

## Building releases

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

## Deployment

Server configuration and managing the API with a systemd service is documented separately.
