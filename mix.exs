defmodule Marked.Mixfile do
  use Mix.Project

  def project do
    [app: :marked,
     version: "0.0.1",
     elixir: "~> 1.1",
     description: "CommonMark compatible Markdown parser",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def package do
    [
      maintainers: ["Igor Šarčević (shiroyasha)"],
      links: %{"GitHub": "https://github.com/shiroyasha/marked"},
      licenses: ["MIT"]
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:poison, "~> 1.5"}]
  end
end
