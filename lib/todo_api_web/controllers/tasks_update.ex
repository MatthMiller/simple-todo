defmodule TodoApiWeb.TasksUpdate do
  use TodoApiWeb, :controller
  alias TodoApi.Tasks.Update

  def update(conn, params) do
    params
    |> Update.call()
    |> handle_request(conn)
  end

  defp handle_request({:ok, _task}, conn) do
    conn
    |> put_status(:ok)
    |> json(%{
      message: "Task updated successfully"
    })
  end

  defp handle_request({:error, _changeset}, conn) do
    conn
    |> put_status(:not_found)
    |> json(%{
      message: "Task not found"
    })
  end
end
