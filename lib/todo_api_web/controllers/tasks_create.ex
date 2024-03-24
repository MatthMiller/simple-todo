defmodule TodoApiWeb.TasksCreate do
  use TodoApiWeb, :controller
  alias TodoApi.Tasks.Create

  def create(conn, params) do
    params
    |> Create.call()
    |> handle_request(conn)
  end

  defp handle_request({:ok, _task}, conn) do
    conn
    |> put_status(:created)
    |> json(%{
      message: "Task criada com sucesso!"
    })
  end

  defp handle_request({:error, changeset}, conn) do
    conn
    |> put_status(:unprocessable_entity)
    |> json(%{
      errors: inspect(changeset)
    })
  end
end
