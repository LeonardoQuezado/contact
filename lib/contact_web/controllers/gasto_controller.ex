defmodule ContactWeb.GastoController do
  use ContactWeb, :controller

  alias Contact.List
  alias Contact.List.Gasto

  def index(conn, _params) do
    gastos = List.list_gastos()
    render(conn, "index.html", gastos: gastos)
  end

  def new(conn, _params) do
    changeset = List.change_gasto(%Gasto{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"gasto" => gasto_params}) do
    case List.create_gasto(gasto_params) do
      {:ok, gasto} ->
        conn
        |> put_flash(:info, "Gasto created successfully.")
        |> redirect(to: Routes.gasto_path(conn, :show, gasto))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    gasto = List.get_gasto!(id)
    render(conn, "show.html", gasto: gasto)
  end

  def edit(conn, %{"id" => id}) do
    gasto = List.get_gasto!(id)
    changeset = List.change_gasto(gasto)
    render(conn, "edit.html", gasto: gasto, changeset: changeset)
  end

  def update(conn, %{"id" => id, "gasto" => gasto_params}) do
    gasto = List.get_gasto!(id)

    case List.update_gasto(gasto, gasto_params) do
      {:ok, gasto} ->
        conn
        |> put_flash(:info, "Gasto updated successfully.")
        |> redirect(to: Routes.gasto_path(conn, :show, gasto))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", gasto: gasto, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    gasto = List.get_gasto!(id)
    {:ok, _gasto} = List.delete_gasto(gasto)

    conn
    |> put_flash(:info, "Gasto deleted successfully.")
    |> redirect(to: Routes.gasto_path(conn, :index))
  end
end
