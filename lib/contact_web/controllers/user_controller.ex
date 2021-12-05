defmodule ContactWeb.UserController do
use ContactWeb, :controller

alias Contact.User
alias Contact.Repo

def index(conn, _params) do
  users = Repo.all(User)
  render(conn, "index.html", users: users)
end


def show(conn, %{"id" => id}) do
  user = Repo.get(User, String.to_integer(id))
  render(conn, "show.html", user: user)
end


def new(conn, _params) do
changeset = User.changeset(%User{}, %{})
render(conn, "new.html", changeset: changeset)
end


def create(conn, %{"user" => user}) do
changeset =  User.changeset(%User{}, user)
{:ok,user} = Repo.insert(changeset)

conn
|> put_flash(:info, "#{user.name} criado com sucesso")
|> redirect(to: Routes.user_path(conn, :index))

end


end
