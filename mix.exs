defmodule SurveyAPI.Mixfile do
  use Mix.Project

  def project do
    [
      app: :survey_api,
      version: "1.6.0",
      elixir: "~> 1.13",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
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
      {:phoenix, "~> 1.6.6"},
      {:phoenix_pubsub, "~> 2.0.0"},
      {:ecto, "~> 3.7.1"},
      {:ecto_sql, "~> 3.7.2"},
      {:postgrex, "~> 0.16.1"},
      {:phoenix_ecto, "~> 4.4.0"},
      {:gettext, "~> 0.19.0"},
      {:cors_plug, "~> 2.0.3"},
      {:plug_cowboy, "~> 2.5.2"},
      {:plug, "~> 1.13.0"},
      {:jason, "~> 1.3.0"},
      {:telemetry, "~> 1.0.0"},
      {:credo, "~> 1.6.1", only: [:dev, :test], runtime: false},
      {:sobelow, "~> 0.11.1", only: :dev},
      {:dialyxir, "~> 1.1.0", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.28.0", only: :dev, runtime: false},
      {:doctor, ">= 0.18.0", only: [:dev], runtime: false},
      {:ex_check, ">= 0.14.0", only: :dev, runtime: false}
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
