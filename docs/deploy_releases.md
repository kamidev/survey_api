## Deployment in production

The current deployment strategy is very simple: install Erlang and Elixir on the production server and build there using the latest stable and tested code. This makes it easy to install on a single production server and build the same way as on dev machines.

More advanced strategies are possible for other deployment targets. Use what makes sense for your needs.

### Prerequisites

#### Source code

The latest code must be checked out on the production server by a user with sufficient permissions.

Before deploying in production, make sure there is a file called `config/prod.secret.exs`. This file is not under version control and should contain passwords and other sensitive data. If it doesn't exist, use `config/prod.exs` as a starting point and create it.

#### Database

WARNING! Once real survey data is already in production, don't drop or reset the database! Either maintain the database manually or create specific Ecto migrations for production.

For a brand new installation, the database is empty. Use the command `MIX_ENV=prod mix ecto.reset` to setup a new database with the required tables.

### Creating a new production release

### Build process

Check out the latest code there and build a new release.

```shell
MIX_ENV=prod mix release
```

Once the build has finished, list the known commands of your current release.

`_build/prod/rel/survey_api/bin/survey_api help`.

Start the new service as a background service (Unix daemon).

```shell
_build/prod/rel/survey_api/bin/survey_api daemon
```

Manually check that the release is up and working.

```shell
curl https://localhost:4001/api/surveys -k
```

```shell
curl https://localhost:4001/api/answers -k
```

These commands should return correct JSON data. All production endpoints are currently configured to run on `https://localhost:4001/api`.

#### Configure automatic restarts

Note that the API does not automatically restart after a server reboot. Assuming the server runs the latest Ubuntu LTS version, this can be fixed by installing a [systemd service](https://mfeckie.github.io/Phoenix-In-Production-With-Systemd/). The source of the SurveyAPI service is [here](https://github.com/kamidev/survey_api/blob/master/deploy/systemd/survey_api.service).

### Additional resources

#### Deployment documentation

Please read through this before attempting to upgrade a production server.

[Official Phoenix deployment guides](http://www.phoenixframework.org/docs/deployment)

#### Other official Phoenix documentation

- Website: http://www.phoenixframework.org/
- Guides: http://phoenixframework.org/docs/overview
- Docs: https://hexdocs.pm/phoenix
- Mailing list: http://groups.google.com/group/phoenix-talk
- Source: https://github.com/phoenixframework/phoenix
