defmodule Contact.ListFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Contact.List` context.
  """

  @doc """
  Generate a gasto.
  """
  def gasto_fixture(attrs \\ %{}) do
    {:ok, gasto} =
      attrs
      |> Enum.into(%{
        description: "some description",
        jafoipago: true,
        name: "some name",
        value: 120.5
      })
      |> Contact.List.create_gasto()

    gasto
  end
end
