defmodule ContactWeb.GastoControllerTest do
  use ContactWeb.ConnCase

  import Contact.ListFixtures

  @create_attrs %{description: "some description", jafoipago: true, name: "some name", value: 120.5}
  @update_attrs %{description: "some updated description", jafoipago: false, name: "some updated name", value: 456.7}
  @invalid_attrs %{description: nil, jafoipago: nil, name: nil, value: nil}

  describe "index" do
    test "lists all gastos", %{conn: conn} do
      conn = get(conn, Routes.gasto_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Gastos"
    end
  end

  describe "new gasto" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.gasto_path(conn, :new))
      assert html_response(conn, 200) =~ "New Gasto"
    end
  end

  describe "create gasto" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.gasto_path(conn, :create), gasto: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.gasto_path(conn, :show, id)

      conn = get(conn, Routes.gasto_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Gasto"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.gasto_path(conn, :create), gasto: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Gasto"
    end
  end

  describe "edit gasto" do
    setup [:create_gasto]

    test "renders form for editing chosen gasto", %{conn: conn, gasto: gasto} do
      conn = get(conn, Routes.gasto_path(conn, :edit, gasto))
      assert html_response(conn, 200) =~ "Edit Gasto"
    end
  end

  describe "update gasto" do
    setup [:create_gasto]

    test "redirects when data is valid", %{conn: conn, gasto: gasto} do
      conn = put(conn, Routes.gasto_path(conn, :update, gasto), gasto: @update_attrs)
      assert redirected_to(conn) == Routes.gasto_path(conn, :show, gasto)

      conn = get(conn, Routes.gasto_path(conn, :show, gasto))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, gasto: gasto} do
      conn = put(conn, Routes.gasto_path(conn, :update, gasto), gasto: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Gasto"
    end
  end

  describe "delete gasto" do
    setup [:create_gasto]

    test "deletes chosen gasto", %{conn: conn, gasto: gasto} do
      conn = delete(conn, Routes.gasto_path(conn, :delete, gasto))
      assert redirected_to(conn) == Routes.gasto_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.gasto_path(conn, :show, gasto))
      end
    end
  end

  defp create_gasto(_) do
    gasto = gasto_fixture()
    %{gasto: gasto}
  end
end
