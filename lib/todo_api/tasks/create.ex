defmodule TodoApi.Tasks.Create do
  alias TodoApi.Tasks.Task
  alias TodoApi.Repo

  def call(params) do
    params
    |> Task.changeset()
    |> Repo.insert()
  end
end
