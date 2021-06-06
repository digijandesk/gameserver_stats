defmodule MeseStatsWeb.Schema do
  use Absinthe.Schema

  alias Timex

  query do
    field(:investigations, list_of(:investigation))
  end

  object :investigation do
    field(:id, :id)
    field(:name, :string)
    field(:subject, :string)
    field(:opened_on, :date_time)
    field(:closed_on, :date_time)
    field(:evidence, list_of(:evidence))
  end

  object :evidence do
    field(:id, :id)
    field(:name, :string)
    field(:location, :string)
    field(:type, :string)
    field(:investigations, list_of(:investigation))
  end

  object :date do
    description("Day, Month, Year fields")
    field(:day, :string)
    field(:month, :string)
    field(:year, :string)
  end

  scalar :time do
    description("Time (in ISOz format)")
    parse(&Timex.parse(&1, "{ISOz}"))
    serialize(&Timex.format!(&1, "{ISOz}"))
  end

  object :date_time do
    field(:date, :date)
    field(:time, :time)
  end
end
