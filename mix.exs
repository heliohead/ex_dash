defmodule ExDash.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ex_dash,
      version: "0.2.0",
      elixir: "~> 1.7",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      source_url: "https://github.com/urbint/ex_dash",
      deps: deps(),
      package: package(),
      description: description()
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:ex_doc, "~> 0.21.2"},
      {:floki, "~> 0.23.0"},
      {:cortex, "~> 0.5.0"}
    ]
  end

  defp description do
    """
    ExDash builds a Dash Docset with your local Elixir app.
    """
  end

  defp package do
    [
      maintainers: ["Russell Matney"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/russmatney/ex_dash"}
    ]
  end
end
