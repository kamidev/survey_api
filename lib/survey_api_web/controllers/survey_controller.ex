defmodule SurveyAPIWeb.SurveyController do
  use SurveyAPIWeb, :controller

  alias SurveyAPI.Surveys
  alias SurveyAPI.Surveys.Survey

  action_fallback SurveyAPIWeb.FallbackController

  def index(conn, _params) do
    surveys = Surveys.list_surveys()
    render(conn, "index.json", surveys: surveys)
  end

  def create(conn, %{"survey" => survey_params}) do
    with {:ok, %Survey{} = survey} <- Surveys.create_survey(survey_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", survey_path(conn, :show, survey))
      |> render("show.json", survey: survey)
    end
  end

  def show(conn, %{"id" => id}) do
    survey = Surveys.get_survey!(id)
    render(conn, "show.json", survey: survey)
  end

  def update(conn, %{"id" => id, "survey" => survey_params}) do
    survey = Surveys.get_survey!(id)

    with {:ok, %Survey{} = survey} <- Surveys.update_survey(survey, survey_params) do
      render(conn, "show.json", survey: survey)
    end
  end

  def delete(conn, %{"id" => id}) do
    survey = Surveys.get_survey!(id)
    with {:ok, %Survey{}} <- Surveys.delete_survey(survey) do
      send_resp(conn, :no_content, "")
    end
  end
end
