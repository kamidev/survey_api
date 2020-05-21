defmodule SurveyAPI.Mixfile do
  use Mix.Project

  def project do
    [
      app: :survey_api,
      version: "1.14.2",
      elixir: "~> 1.10",
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
      {:phoenix, "~> 1.5.1"},
      {:phoenix_pubsub, "~> 2.0.0"},
      {:ecto, "~> 3.4.4"},
      {:ecto_sql, "~> 3.4.4"},
      {:postgrex, "~> 0.15.0"},
      {:phoenix_ecto, "~> 4.1.0"},
      {:gettext, "~> 0.18.0"},
      {:cors_plug, "~> 2.0.2"},
      {:plug_cowboy, "~> 2.2.1"},
      {:plug, "~> 1.10.1"},
      {:pid_file, "~> 0.1.1"},
      {:jason, "~> 1.2.0"},
      {:telemetry, "~> 0.4.1"},
      {:credo, "~> 1.4.0", only: [:dev, :test], runtime: false},
      {:sobelow, "~> 0.10.1", only: :dev},
      {:dialyxir, "~> 1.0.0", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.22.1", only: :dev, runtime: false},
      {:ex_check, ">= 0.0.0", only: :dev, runtime: false}
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
