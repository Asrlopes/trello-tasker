import Config

database_url =
  System.get_env("ecto://45b0f47d-d43e-46ee-9e3f-2cb8cd003898-user:pw-aa311bb4-9556-44f2-b90f-0a2b925b98a2@postgres-free-tier-v2020.gigalixir.com:5432/45b0f47d-d43e-46ee-9e3f-2cb8cd003898") ||
    raise """
    environment variable DATABASE_URL is missing.
    For example: ecto://USER:PASS@HOST/DATABASE
    """

config :trello_tasker, TrelloTasker.Repo,
  # ssl: true,
  url: database_url,
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

config :trello_tasker, TrelloTaskerWeb.Endpoint,
  http: [
    port: String.to_integer(System.get_env("PORT") || "4000"),
    transport_options: [socket_opts: [:inet6]]
  ],
  secret_key_base: secret_key_base
  check_origin: false


    config :trello_tasker, TrelloTaskerWeb.Endpoint, server: true
