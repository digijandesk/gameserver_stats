defmodule MeseStats.Repo do
  use Ecto.Repo,
    otp_app: :mese_stats,
    adapter: Ecto.Adapters.Postgres
end
