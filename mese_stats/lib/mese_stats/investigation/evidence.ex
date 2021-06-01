defmodule MeseStats.Investigation.Evidence do
  @moduledoc """
  A possibly backed and categorized resource of some type
  Relating to 0 or more investigations
  """
  use Ecto.Schema

  import Ecto.Changeset

  alias MeseStats.Investigation.{Evidence, Investigation}

  schema "evidence" do
    field :name, :string
    field :location, :string
    field :type, :string

    many_to_many :investigations, Investigation, join_through: "investigations_evidence"

    timestamps()
  end

  def changeset(%Evidence{} = evidence, attrs) do
    evidence
    |> cast(attrs, [:name, :location, :type])
    |> validate_required([:name, :type])
  end
end
