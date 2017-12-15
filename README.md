# SurveyAPI



To test locally:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.reset`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit the endpoints with your browser.

[`localhost:4000/api/surveys`](http://localhost:4000/api/surveys)

[`localhost:4000/api/users`](http://localhost:4000/api/users)

[`localhost:4000/api/answers`](http://localhost:4000/api/answers)

## Installation

For production use, the project is configured to build releases with Distillery. The basic prodecure is outlined here: 

[How to configure and deploy an Elixir app to a VPS](https://www.amberbit.com/blog/2017/7/17/deploy-elixir-app-to-a-vps/).

The current strategy is to install Erlang on the production server and immediately download the resulting runtime binaries. This makes it possible to build and test working releases both directly on the production server and on development machines using other operation systems, for instance MacOS. 

This process will be described in more detail soon...

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
