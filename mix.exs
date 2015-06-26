defmodule Random.Mixfile do
  use Mix.Project

  def project do
    [ app: :random,
      version: "0.0.3",
      elixir: "~> 1.0.0",
      description: description,
      package: package,
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    []
  end

  defp description do
    """
    A Elixir wrapper for the random module of Erlang.

    This is not cryptographically strong as the random module of Erlang."
    """
  end

  defp package do
    [links: %{"Github" => "https://github.com/mururu/elixir-random"}]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, "0.1", git: "https://github.com/elixir-lang/foobar.git" }
  defp deps do
    []
  end
end
