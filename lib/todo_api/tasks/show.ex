defmodule TodoApi.Tasks.Show do
  alias TodoApi.Tasks.Task
  alias TodoApi.Repo

  def call() do
    Repo.all(Task)
  end

  def get_one(id) do
    Repo.get(Task, id)
  end
end
