import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :food_truck_api, FoodTruckApi.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "food_truck_api_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :food_truck_api, FoodTruckApiWeb.Endpoint,
  http: [ip: {0, 0, 0, 0}, port: 4002],
  secret_key_base: "2TFMZOuTkjWsgg9XCAtL/fK9K5kdHlknNrtiLNHpmz9ivAbbbAQNcmY7UEKl4Ux8",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
