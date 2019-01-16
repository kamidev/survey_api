## Deploying a new release to production

Before deploying in production, make sure there is a file called `config/prod.secret.exs`. This file is not under version control and is used for passwords and other sensitive data. See `config/prod.exs` for an example of what to put there.

On the production server, check out the latest code, then use this to deploy a completely new release:

```shell
MIX_ENV=prod mix release
_build/prod/rel/survey_api/bin/survey_api start
```

Check that the release is up with `curl http://localhost:4001/api/surveys`. This should return JSON for some survey templates. All production endpoints are currently configured to run on `localhost:4001/api`.

List available application commands with `_build/prod/rel/survey_api/bin/survey_api help`

Note that the API will not automatically restart after a server reboot. Assuming the server runs the latest Ubuntu LTS version, this can be fixed byinstalling a [systemd service](https://mfeckie.github.io/Phoenix-In-Production-With-Systemd/). The source for this service is found under `/deploy/system`.

WARNING! `mix ecto.reset` drops the database and sets up a sample survey. If real survey data is already in production, don't do that! Either create Ecto migrations for the production database or do it manually.

## Additional deployment resources

Below are more resources about building and managing releases. It is good to read them before attempting to upgrade a production server.

[Mastering Elixir Releases with Distillery — A (Pretty) Complete Guide](https://hackernoon.com/mastering-elixir-releases-with-distillery-a-pretty-complete-guide-497546f298bc)

[Using Distillery With Phoenix](https://hexdocs.pm/distillery/use-with-phoenix.html)

[Official Phoenix deployment guides](http://www.phoenixframework.org/docs/deployment)

Note that we currently do no use Edeliver to fully automate the release process. For frequent updates or multiple servers, this is worth looking into.

[How To Automate Elixir-Phoenix Deployment with Distillery and edeliver on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-automate-elixir-phoenix-deployment-with-distillery-and-edeliver-on-ubuntu-16-04).

### Official Phoenix resources

- Website: http://www.phoenixframework.org/
- Guides: http://phoenixframework.org/docs/overview
- Docs: https://hexdocs.pm/phoenix
- Mailing list: http://groups.google.com/group/phoenix-talk
- Source: https://github.com/phoenixframework/phoenix
