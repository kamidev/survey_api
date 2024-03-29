[
  ## all available options with default values (see `mix check` docs for description)
  # parallel: true,
  # skipped: true,

  ## list of tools (see `mix check` docs for defaults)
  tools: [
    ## curated tools may be disabled (e.g. the check for compilation warnings)
    {:compiler, false},
    {:doctor, false},
    {:dialyzer, false},

    ## Run Credo using default settings. Display results in compact format.
    {:credo, "mix credo --format oneline"},
    # Check security as specified by '.sobelow-conf' file at project root
    {:sobelow, "mix sobelow --config"},

    ## ...or reordered (e.g. to see output from ex_unit before others)
    # {:ex_unit, order: -1},
    {:ex_unit, ["mix", "cmd", "mix test --color || mix test --color --failed"]}

    ## custom new tools may be added (mix tasks or arbitrary commands)
    # {:my_mix_task, command: "mix release", env: %{"MIX_ENV" => "prod"}},
    # {:my_arbitrary_tool, command: "npm test", cd: "assets"},
    # {:my_arbitrary_script, command: ["my_script", "argument with spaces"], cd: "scripts"}
  ]
]
