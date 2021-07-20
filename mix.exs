defmodule SurveyAPI.Mixfile do
  use Mix.Project

  def project do
    [
      app: :survey_api,
      version: "1.25.4",
      elixir: "~> 1.11",
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
      {:phoenix, "~> 1.5.9"},
      {:phoenix_pubsub, "~> 2.0.0"},
      {:ecto, "~> 3.6.2"},
      {:ecto_sql, "~> 3.6.2"},
      {:postgrex, "~> 0.15.9"},
      {:phoenix_ecto, "~> 4.3.0"},
      {:gettext, "~> 0.18.2"},
      {:cors_plug, "~> 2.0.3"},
      {:plug_cowboy, "~> 2.5.0"},
      {:plug, "~> 1.11.1"},
      {:jason, "~> 1.2.2"},
      {:telemetry, "~> 0.4.3"},
      {:credo, "~> 1.5.6", only: [:dev, :test], runtime: false},
      {:sobelow, "~> 0.11.1", only: :dev},
      {:dialyxir, "~> 1.1.0", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.25.0", only: :dev, runtime: false},
      {:doctor, ">= 0.18.0", only: [:dev], runtime: false},
      {:ex_check, ">= 0.14 .0", only: :dev, runtime: false}
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
