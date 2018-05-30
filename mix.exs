defmodule Modglobal.MixProject do
  use Mix.Project

  @version "0.0.1"
  def project do
    [
      app: :quick,
      version: @version,
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      source_url: "https://github.com/AnilRedshift/quick",
      docs: [source_ref: "v#{@version}", main: "readme", extras: ["README.md"]],
      description: description(),
      package: package()
    ]
  end

  def application do
    [
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.18.3", only: :dev},
    ]
  end

  defp description do
    "JSON-optimized web server for elixir"
  end

  defp package do
    [
      maintainers: ["Anil Kulkarni"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/AnilRedshift/quick"}
    ]
  end
end
