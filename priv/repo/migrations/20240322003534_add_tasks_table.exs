defmodule TodoApi.Repo.Migrations.AddTasksTable do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add(:title, :string)
      add(:description, :string)
      add(:completed, :boolean, default: false)
      add(:priority, :string, default: "none")

      timestamps()
    end
  end
end
