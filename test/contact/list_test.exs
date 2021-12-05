defmodule Contact.ListTest do
  use Contact.DataCase

  alias Contact.List

  describe "gastos" do
    alias Contact.List.Gasto

    import Contact.ListFixtures

    @invalid_attrs %{description: nil, jafoipago: nil, name: nil, value: nil}

    test "list_gastos/0 returns all gastos" do
      gasto = gasto_fixture()
      assert List.list_gastos() == [gasto]
    end

    test "get_gasto!/1 returns the gasto with given id" do
      gasto = gasto_fixture()
      assert List.get_gasto!(gasto.id) == gasto
    end

    test "create_gasto/1 with valid data creates a gasto" do
      valid_attrs = %{description: "some description", jafoipago: true, name: "some name", value: 120.5}

      assert {:ok, %Gasto{} = gasto} = List.create_gasto(valid_attrs)
      assert gasto.description == "some description"
      assert gasto.jafoipago == true
      assert gasto.name == "some name"
      assert gasto.value == 120.5
    end

    test "create_gasto/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = List.create_gasto(@invalid_attrs)
    end

    test "update_gasto/2 with valid data updates the gasto" do
      gasto = gasto_fixture()
      update_attrs = %{description: "some updated description", jafoipago: false, name: "some updated name", value: 456.7}

      assert {:ok, %Gasto{} = gasto} = List.update_gasto(gasto, update_attrs)
      assert gasto.description == "some updated description"
      assert gasto.jafoipago == false
      assert gasto.name == "some updated name"
      assert gasto.value == 456.7
    end

    test "update_gasto/2 with invalid data returns error changeset" do
      gasto = gasto_fixture()
      assert {:error, %Ecto.Changeset{}} = List.update_gasto(gasto, @invalid_attrs)
      assert gasto == List.get_gasto!(gasto.id)
    end

    test "delete_gasto/1 deletes the gasto" do
      gasto = gasto_fixture()
      assert {:ok, %Gasto{}} = List.delete_gasto(gasto)
      assert_raise Ecto.NoResultsError, fn -> List.get_gasto!(gasto.id) end
    end

    test "change_gasto/1 returns a gasto changeset" do
      gasto = gasto_fixture()
      assert %Ecto.Changeset{} = List.change_gasto(gasto)
    end
  end
end
