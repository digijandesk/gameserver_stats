defmodule MeseStatsWeb.PageController do
  use MeseStatsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
