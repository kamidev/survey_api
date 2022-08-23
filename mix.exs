defmodule SurveyAPI.Mixfile do
  use Mix.Project

  def project do
    [
      app: :survey_api,
      version: "1.9.3",
      elixir: "~> 1.13",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix] ++ Mix.compilers(),
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
      {:phoenix, "~> 1.6.11"},
      {:phoenix_pubsub, "~> 2.1.1"},
      {:ecto, "~> 3.8.4"},
      {:ecto_sql, "~> 3.8.3"},
      {:postgrex, "~> 0.16.4"},
      {:phoenix_ecto, "~> 4.4.0"},
      {:gettext, "~> 0.20.0"},
      {:cors_plug, "~> 3.0.3"},
      {:plug_cowboy, "~> 2.5.2"},
      {:plug, "~> 1.13.6"},
      {:jason, "~> 1.3.0"},
      {:telemetry, "~> 1.1.0"},
      {:credo, "~> 1.6.5", only: [:dev, :test], runtime: false},
      {:sobelow, "~> 0.11.1", only: :dev},
      {:dialyxir, "~> 1.2.0", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.28.5", only: :dev, runtime: false},
      {:doctor, ">= 0.19.0", only: [:dev], runtime: false},
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
