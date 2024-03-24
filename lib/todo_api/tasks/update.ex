defmodule TodoApi.Tasks.Update do
  alias TodoApi.Tasks.Task
  alias TodoApi.Repo

  def call(params) do
    case Repo.get(Task, params["id"]) do
      nil ->
        {:error, "Task not found"}

      task ->
        changeset = Task.changeset(task, params)
        Repo.update(changeset)
    end
  end
end
