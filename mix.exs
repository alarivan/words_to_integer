defmodule WordsToInteger.MixProject do
  use Mix.Project

  def project do
    [
      app: :words_to_integer,
      version: "0.1.1",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      name: "WordsToInteger",
      description: description(),
      package: package(),
      source_url: "https://github.com/alarivan/words_to_integer",
      deps: deps()
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
      links: %{"GitHub" => "https://github.com/alarivan/words_to_integer"}
    ]
  end
end
