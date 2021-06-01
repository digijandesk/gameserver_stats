defmodule MeseStats.Investigation.Investigation do
  @moduledoc """
  A cluster of evidence and some metadata
  """
  use Ecto.Schema

  import Ecto.Changeset

  alias MeseStats.Investigation.{Evidence, Investigation}

  schema "investigations" do
    field :name, :string
    field :subject, :string
    field :opened_on, :date
    field :closed_on, :date

    many_to_many :evidence, Evidence, join_through: "investigations_evidence"

    timestamps()
  end

  def changeset(%Investigation{} = investigation, attrs) do
    investigation
    |> cast(attrs, [:name, :subject, :opened_on, :closed_on])
    |> validate_required([:name, :subject, :opened_on])
  end
end
