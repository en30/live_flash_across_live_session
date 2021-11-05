defmodule LiveFlashAcrossLiveSession.Repo do
  use Ecto.Repo,
    otp_app: :live_flash_across_live_session,
    adapter: Ecto.Adapters.Postgres
end
