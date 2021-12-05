defmodule Contact.List.Gasto do
  use Ecto.Schema
  import Ecto.Changeset

  schema "gastos" do
    field :description, :string
    field :jafoipago, :boolean, default: false
    field :name, :string
    field :value, :float

    timestamps()
  end

  @doc false
  def changeset(gasto, attrs) do
    gasto
    |> cast(attrs, [:name, :description, :value, :jafoipago])
    |> validate_required([:name, :description, :value, :jafoipago])
  end
end
