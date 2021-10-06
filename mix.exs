defmodule NewWorldBot.MixProject do
  use Mix.Project

  def project do
    [
      app: :new_world_bot,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      applications: [:httpoison],
      extra_applications: [
        :logger,
        :floki,
        :quantum,
        :nostrum
      ],
      mod: {NewWorldBot.Application, []},
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:httpoison, "~> 1.8.0"},
      {:floki, "~> 0.31.0"},
      {:nostrum, "~> 0.4"},
      {:quantum, "~> 3.0"},
    ]
  end
end
