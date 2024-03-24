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

  def get_one(conn, %{"id" => id}) do
    conn
    |> put_status(
      case Show.get_one(id) do
        nil -> :not_found
        _ -> :ok
      end
    )
    |> json(
      case Show.get_one(id) do
        nil -> %{error: "Task not found"}
        # task é o retorno da condição do case
        task -> %{task: task}
      end
    )
  end
end
