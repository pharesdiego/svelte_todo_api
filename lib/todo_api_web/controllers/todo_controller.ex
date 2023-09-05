defmodule TodoApiWeb.TodoController do
  use TodoApiWeb, :controller

  alias TodoApi.Todos
  alias TodoApi.Todos.Todo

  action_fallback(TodoApiWeb.FallbackController)

  def index(conn, _params) do
    todos = Todos.list_todos()
    render(conn, :index, todos: todos)
  end

  def create(conn, todo_params) do
    with {:ok, %Todo{} = todo} <- Todos.create_todo(todo_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/todos/#{todo.id}")
      |> render(:show, todo: todo)
    end
  end

  def show(conn, %{"id" => id}) do
    todo = Todos.get_todo!(id)
    render(conn, :show, todo: todo)
  end

  def update(conn, %{"id" => id, "title" => title, "content" => content}) do
    todo = Todos.get_todo!(id)

    with {:ok, %Todo{} = todo} <-
           Todos.update_todo(todo, %{"title" => title, "content" => content}) do
      render(conn, :show, todo: todo)
    end
  end

  def delete(conn, %{"id" => id}) do
    todo = Todos.get_todo!(id)

    with {:ok, %Todo{}} <- Todos.delete_todo(todo) do
      send_resp(conn, :no_content, "")
    end
  end
end
