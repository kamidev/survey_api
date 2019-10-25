defmodule SurveyAPIWeb.AnswerController do
  use SurveyAPIWeb, :controller

  alias SurveyAPI.Answers
  alias SurveyAPI.Answers.Answer

  action_fallback(SurveyAPIWeb.FallbackController)

  def index(conn, _params) do
    answers = Answers.list_answers()
    render(conn, "index.json", answers: answers)
  end

  def create(conn, %{"answer" => answer_params}) do
    with {:ok, %Answer{} = answer} <- Answers.create_answer(answer_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.answer_path(conn, :show, answer))
      |> render("show.json", answer: answer)
    end
  end

  @spec show(Plug.Conn.t(), map) :: Plug.Conn.t()
  def show(conn, %{"id" => survey_id}) do
    answers = Answers.list_answers(survey_id)
    render(conn, "index.json", answers: answers)
  end

  def update(conn, %{"id" => id, "answer" => answer_params}) do
    answer = Answers.get_answer!(id)

    with {:ok, %Answer{} = answer} <- Answers.update_answer(answer, answer_params) do
      render(conn, "show.json", answer: answer)
    end
  end

  def delete(conn, %{"id" => id}) do
    answer = Answers.get_answer!(id)

    with {:ok, %Answer{}} <- Answers.delete_answer(answer) do
      send_resp(conn, :no_content, "")
    end
  end
end
