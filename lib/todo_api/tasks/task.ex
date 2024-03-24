defmodule TodoApi.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [:title, :completed]

  # Diretiva para o Jason saber como parsear o schema
  @derive {Jason.Encoder, only: [:id, :title, :description, :completed, :priority]}
  schema "tasks" do
    field(:title, :string)
    field(:description, :string)
    field(:completed, :boolean, default: false)
    field(:priority, :string, default: "none")

    timestamps()
  end

  def changeset(task \\ %__MODULE__{}, params) do
    task
    |> cast(params, [:title, :description, :completed, :priority])
    |> validate_required(@required_fields)
    |> validate_length(:title, min: 1, max: 100)
    |> validate_length(:description, max: 500)
    |> validate_inclusion(:priority, ["none", "low", "medium", "high"])
    # Validate if completed is boolean with inclusion
    |> validate_inclusion(:completed, [true, false])
  end
end
