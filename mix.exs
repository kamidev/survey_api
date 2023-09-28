defmodule SurveyAPI.Mixfile do
  use Mix.Project

  def project do
    [
      app: :survey_api,
      version: "1.19.8",
      elixir: "~> 1.15",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {SurveyAPI.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.7.7"},
      {:phoenix_view, "~> 2.0"},
      {:phoenix_pubsub, "~> 2.1.2"},
      {:ecto, "~> 3.10.3"},
      {:ecto_sql, "~> 3.10.2"},
      {:postgrex, "~> 0.17.3"},
      {:phoenix_ecto, "~> 4.4.2"},
      {:gettext, "~> 0.23.1"},
      {:cors_plug, "~> 3.0.3"},
      {:plug_cowboy, "~> 2.6.1"},
      {:plug, "~> 1.14.2"},
      {:jason, "~> 1.4.1"},
      {:telemetry, "~> 1.2.1"},
      {:credo, "~> 1.7.0", only: [:dev, :test], runtime: false},
      {:sobelow, "~> 0.13.0", only: :dev},
      {:dialyxir, "~> 1.4.1", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.30.6", only: :dev, runtime: false},
      {:doctor, ">= 0.21.0", only: [:dev], runtime: false},
      {:mix_audit, ">= 2.1.1", only: [:dev], runtime: false},
      {:ex_check, ">= 0.15.0", only: :dev, runtime: false}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: [
        "ecto.drop --quiet",
        "ecto.create --quiet",
        "ecto.migrate",
        "test"
      ]
    ]
  end
end
