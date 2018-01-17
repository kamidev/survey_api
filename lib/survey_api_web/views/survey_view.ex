defmodule SurveyAPIWeb.SurveyView do
  use SurveyAPIWeb, :view
  alias SurveyAPIWeb.SurveyView

  def render("index.json", %{surveys: surveys}) do
    %{data: render_many(surveys, SurveyView, "survey.json")}
  end

  def render("show.json", %{survey: survey}) do
    %{data: render_one(survey, SurveyView, "survey.json")}
  end

  def render("survey.json", %{survey: survey}) do
    %{
      id: survey.id,
      name: survey.name,
      survey_id: survey.survey_id,
      survey_design: survey.survey_design
    }
  end
end
