defmodule SurveyAPIWeb.AnswerView do
  use SurveyAPIWeb, :view
  alias SurveyAPIWeb.AnswerView

  def render("index.json", %{answers: answers}) do
    %{data: render_many(answers, AnswerView, "answer.json")}
  end

  def render("show.json", %{answer: answer}) do
    %{data: render_one(answer, AnswerView, "answer.json")}
  end

  def render("answer.json", %{answer: answer}) do
    %{
      id: answer.id,
      pseudonym: answer.pseudonym,
      user_id: answer.user_id,
      survey_id: answer.survey_id,
      survey_answers: answer.survey_answers
    }
  end
end
