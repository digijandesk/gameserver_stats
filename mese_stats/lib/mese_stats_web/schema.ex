defmodule MeseStatsWeb.Schema do
  use Absinthe.Schema

  query do
    field :investigations, list_of(:investigation)
  end

  object :investigation do
    field :id, :id
    field :name, :string
    field :subject, :string
    field :open_date, :string
    field :close_date, :string
  end
end
