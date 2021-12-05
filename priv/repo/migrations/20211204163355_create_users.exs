defmodule Contact.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :password, :string
      add :receita, :float
      add :despesa, :float

      timestamps()
    end
  end
end
