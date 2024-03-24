defmodule TodoApiWeb.TasksShow do
  use TodoApiWeb, :controller
  alias TodoApi.Tasks.Show

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> json(%{
      tasks: Show.call()
    })
  end
end
