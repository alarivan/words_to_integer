defmodule WordsToInteger.MixProject do
  use Mix.Project

  @version "0.1.1"
  @github "https://github.com/alarivan/words_to_integer"

  def project do
    [
      app: :words_to_integer,
      version: @version,
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      name: "WordsToInteger",
      description: description(),
      package: package(),
      deps: deps(),
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    []
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.21", only: :dev, runtime: false}
    ]
  end

  defp description() do
    "Converts numbers spelled out as English words to integers."
  end

  defp package() do
    [
      maintainers: ["alarivan"],
      licenses: ["MIT"],
      links: %{"GitHub" => @github}
    ]
  end

  defp docs do
    [
      main: "WordsToInteger",
      source_ref: "v#{@version}",
      source_url: @github
    ]
  end
end
