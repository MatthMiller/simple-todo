defmodule TodoApiWeb.TasksDelete do
  use TodoApiWeb, :controller
  alias TodoApi.Tasks.Delete

  def delete(conn, %{"id" => id}) do
    # check if the task was deleted
    conn
    |> handle_request(id)
  end

  defp handle_request(conn, id) do
    case Delete.call(id) do
      {:ok, _task} ->
        conn
        |> put_status(:ok)
        |> json(%{
          message: "Task successfully deleted"
        })

      {:error, _changeset} ->
        conn
        |> put_status(:not_found)
        |> json(%{
          message: "Task not found"
        })
    end
  end
end
