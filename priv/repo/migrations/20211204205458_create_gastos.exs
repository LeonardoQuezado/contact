defmodule Contact.Repo.Migrations.CreateGastos do
  use Ecto.Migration

  def change do
    create table(:gastos) do
      add :name, :string
      add :description, :string
      add :value, :float
      add :jafoipago, :boolean, default: false, null: false

      timestamps()
    end
  end
end
