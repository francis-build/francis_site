defmodule FrancisSite.MixProject do
  use Mix.Project

  def project do
    [
      app: :francis_site,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {FrancisSite, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp aliases do
    [
      "assets.build": ["tailwind default", "francis.digest priv/static --clean"]
    ]
  end

  defp deps do
    [
      {:francis, "~> 0.4"},
      {:tailwind, "~> 0.4", runtime: Mix.env() == :dev},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false}
    ]
  end
end
