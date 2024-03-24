defmodule TodoApiWeb.Router do
  use TodoApiWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", TodoApiWeb do
    pipe_through(:api)

    post "/tasks", TasksCreate, :create
    # post("/tasks", TasksController, :create)
  end

  # Enable LiveDashboard in development
  if Application.compile_env(:todo_api, :dev_routes) do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: TodoApiWeb.Telemetry
    end
  end
end
