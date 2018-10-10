defmodule SurveyAPIWeb.UserController do
  use SurveyAPIWeb, :controller

  alias SurveyAPI.Surveys
  alias SurveyAPI.Surveys.User

  action_fallback(SurveyAPIWeb.FallbackController)

  def index(conn, _params) do
    users = Surveys.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Surveys.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Surveys.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Surveys.get_user!(id)

    with {:ok, %User{} = user} <- Surveys.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Surveys.get_user!(id)

    with {:ok, %User{}} <- Surveys.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
