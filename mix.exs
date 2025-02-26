defmodule XZ.MixProject do
  use Mix.Project

  def project do
    [
      app: :xz,
      compilers: [:elixir_make] ++ Mix.compilers,
      version: "0.4.1",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :crypto]
    ]
  end

  def description do
    "Elixir NIF for the XZ data compression library. Requires liblzma to be installed on the target machine."
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:elixir_make,  "~> 0.7.8", runtime: false},
      {:ex_doc, "~> 0.37.2", only: :dev},
      {:dialyxir, "~> 1.4", only: [:dev], runtime: false}
    ]
  end

  def package do
    [
      name: "xz",
      maintainers: ["Warren Kenny"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/wrren/xz.ex"},
      files: ~w(lib Makefile mix.exs mix.lock README.md c_src test .formatter.exs)
    ]
  end
end
