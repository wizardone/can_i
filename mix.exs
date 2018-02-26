defmodule CanI.Mixfile do
  use Mix.Project

  def project do
    [
      app: :can_i,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      description: description(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [{:ex_doc, ">= 0.0.0", only: :dev}]
  end

  defp description do
    "A small and simple authorization system for Elixir based applications"
  end

  defp package do
    [
      name: :can_i,
      maintainers: ["Stefan Slaveykov"],
      licenses: ["MiT"],
      links: %{"GitHub" => "https://github.com/wizardone/can_i.git"}
    ]
  end

end
