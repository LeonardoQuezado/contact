defmodule Contact.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :despesa, :float
    field :email, :string
    field :name, :string
    field :password, :string
    field :receita, :float

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password, :receita, :despesa])
    |> validate_required([:name, :email, :password, :receita, :despesa])
  end
end
