# SurveyAPI

SurveyAPI is an [Elixir](https://elixir-lang.org/) backend for [SurveyJS](https://surveyjs.io/Overview/Library/), a Javascript library for creating online forms and surveys.

Web applications displaying surveys can use API calls to fetch survey definitions and store survey answers. Both surveys and answers follow a documented JSON format. Our backend store them in Postgres, using [Postgres JSONB](http://www.silota.com/docs/recipes/sql-postgres-json-data-types.html) to make JSON search quick and painless. 

Phoenix API generators were originally used to create the API. [Here](https://becoming-functional.com/building-a-rest-api-with-phoenix-1-3-part-1-9f8754aeaa87) is the step-by-step description we used. The official Phoenix documentation has a long discussion about [the use and limitations of generators](https://hexdocs.pm/phoenix/contexts.html). To summarize: you should not use generators without understanding what they do. Here are some tutorials for writing an API [manually](https://elixircasts.io/json-api-with-phoenix-1.4) or using [Phoenix 1.5 generators](https://www.poeticoding.com/another-guide-to-build-a-json-api-with-phoenix-1-5/).

## Prerequisites

### Erlang and Elixir

Elixir requires the Erlang/OTP runtime. Current versions for this project can be found in the root level file `.tool-versions`. Please make sure the correct versions are installed. Using the [asdf version manager](https://github.com/asdf-vm/asdf) to [install and manage Erlang and Elixir](https://www.mitchellhanberg.com/post/2017/10/05/installing-erlang-and-elixir-using-asdf/) is highly recommended for development. For production there are several other deployment alternatives.

Check your installation by running the commandline shell `iex`. The result should be similar to this:

```> survey_api git:(master) iex
Erlang/OTP 24 [erts-12.0.3] [source] [64-bit] [smp:12:12] [ds:12:12:10] [async-threads:1] [jit]

Interactive Elixir (1.12.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)>
```

### Phoenix

Phoenix is the Elixir web framework. First, make sure you have the latest version of Elixir and Erlang package managers.

```shell
mix local.hex
mix local.rebar
```

Then install the latest version of Phoenix.

```shell
mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez
```

### Postgres

Postgres 14 is currently used for development. At least one database user must have permissions to create databases.

On developer machines you can use a `postgres` user with password `postgres` (the default for new Elixir projects). In production, datatabase logins MUST be more secure. Phoenix by default keeps production login and other sensitive information in a file named `prod.secret.exs`. For security reasons, this file should not be kept under version control.

Note! Docker-based deployments use environment variables instead of 'prod.secret.exs'.

## Development

### Test installation on development machine

Clone this repository

```shell
  git clone https://github.com/kamidev/survey_api.git
  cd survey_ap
```

Install dependencies

```shell
mix deps.get
```

Setup SSH for development. See https://hexdocs.pm/phoenix/using_ssl.html#ssl-in-development

```shell
mix phx.gen.cert
```

Wipe the dev database clean and load some sample data

```shell
mix ecto.reset
```

Start the Phoenix server

```shell
iex -S mix phx.server
```

Then check the API endpoints from another terminal.

```shell
curl https://localhost:4001/api/surveys -k
```

```shell
curl https://localhost:4001/api/answers -k
```

After a clean installation, both endpoints return `{"data":[]}`. If the database already has some content, some JSON data will be returned.

You can also check the API using your browser.

[`https://localhost:4001/api/surveys`](https://localhost:4001/api/surveys)

[`https://localhost:4001/api/answers`](https://localhost:4001/api/answers)

Note! Make a browser security exception for Elixir's self-certified SSL certificates if necessary.

### Automatic checking of source code dependencies

This repo uses [Github Dependabot](https://docs.github.com/en/code-security/supply-chain-security/about-dependabot-version-updates) to check for updated dependencies.
Pull requests for updated dependencies will be generated automatically

### Automated code quality tools

Currently, the following tools are configured:

[credo](https://github.com/rrrene/credo) - static code analysis tool with a focus on teaching and code consistency

[dialyxir](https://github.com/jeremyjh/dialyxir) - code analysis using [Dialyzer](http://erlang.org/doc/man/dialyzer.html)

[ex_doc](https://github.com/elixir-lang/ex_doc) - produce HTML and EPUB documentation

[ex_unit](https://hexdocs.pm/ex_unit/master/ExUnit.html) - unit testing framework

[formatter](https://hexdocs.pm/mix/1.9.2/Mix.Tasks.Format.html#content) - built-in automatic code formatter

[sobelow](https://github.com/nccgroup/sobelow) - security-focused static analysis of Phoenix Framework

A single mix task is used to run all these tools :

```shell
➜ mix check
```

Sample session:

```shell
... lots of detailed output omitted here

=> finished in 0:15

✓ compiler success in 0:05
✓ credo success in 0:01
✓ dialyzer success in 0:10
✓ ex_doc success in 0:03
✓ ex_unit success in 0:08
✓ formatter success in 0:01
✓ sobelow success in 0:02
```

Please make sure the [ex_check](https://github.com/karolsluszniak/ex_check) library is installed and correctly configured to get the most out of `mix check`.

## Building releases for production use

To deploy SurveyAPI in production, we use an [Elixir release](https://hexdocs.pm/mix/Mix.Tasks.Release.html). Here is a short [tutorial](https://henriktudborg.dk/articles/2019/03/10/elixir-1.9.1-releases) about that.

Typically, you first test your release on a developer machine. To build a production release, first run:

`MIX_ENV=prod mix release`

If this succeeds, you will see a message describing various options for running the release. Try running it in the background:

`_build/prod/rel/survey_api/bin/survey_api daemon`

Verify that `localhost:4000/api/surveys` and other endpoints produce valid JSON. Then run `mix check` and deal with any problems reported by the automated tools.

Once the release is good enough for production, commit and push the latest code.

### Deployment

Read more about deployment, server configuration and using systemd services [here](docs/deploy_releases.md).
