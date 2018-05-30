use Mix.Config

config :quick,
  port: {:system, :integer, "PORT", 4000},
  scheme: {:system, :atom, "HTTP_SCHEME", :http}

# import_config "#{Mix.env}.exs"
