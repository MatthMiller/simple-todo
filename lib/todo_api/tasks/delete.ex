defmodule TodoApi.Tasks.Delete do
  alias TodoApi.Tasks.Task
  alias TodoApi.Repo

  def call(id) do
    case Repo.get(Task, id) do
      nil -> {:error, "Task not found"}
      task -> Repo.delete(task)
    end
  end
end
