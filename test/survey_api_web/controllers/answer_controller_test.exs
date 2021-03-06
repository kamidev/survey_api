defmodule SurveyAPIWeb.AnswerControllerTest do
  use SurveyAPIWeb.ConnCase

  alias SurveyAPI.Answers
  alias SurveyAPI.Answers.Answer

  @create_attrs %{
    pseudonym: "some pseudonym",
    survey_id: 42,
    user_id: 42,
    project_id: "123-4567",
    survey_answers: %{"Quality" => %{"affordable" => 2}}
  }
  @update_attrs %{
    pseudonym: "some updated pseudonym",
    survey_id: 42,
    user_id: 43,
    project_id: "123-4567",
    survey_answers: %{"Quality" => %{"affordable" => 3}}
  }
  @invalid_attrs %{pseudonym: nil, survey_id: nil, user_id: nil, survey_answers: nil}

  def fixture(:answer) do
    {:ok, answer} = Answers.create_answer(@create_attrs)
    answer
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all answers", %{conn: conn} do
      conn = get(conn, answer_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "Create answer" do
    test "renders answer when data is valid", %{conn: conn} do
      conn = post(conn, answer_path(conn, :create), answer: @create_attrs)
      assert %{"survey_id" => survey_id} = json_response(conn, 201)["data"]

      conn = get(conn, answer_path(conn, :show, survey_id))

      assert json_response(conn, 200)["data"] == [
               %{
                 "survey_id" => 42,
                 "project_id" => "123-4567",
                 "survey_answers" => %{"Quality" => %{"affordable" => 2}}
               }
             ]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, answer_path(conn, :create), answer: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update answer" do
    setup [:create_answer]

    test "renders answer when data is valid", %{
      conn: conn,
      answer: %Answer{survey_id: survey_id} = answer
    } do
      conn = put(conn, answer_path(conn, :update, answer), answer: @update_attrs)
      assert %{"survey_id" => ^survey_id} = json_response(conn, 200)["data"]

      conn = get(conn, answer_path(conn, :show, survey_id))

      assert json_response(conn, 200)["data"] == [
               %{
                 "survey_id" => 42,
                 "project_id" => "123-4567",
                 "survey_answers" => %{"Quality" => %{"affordable" => 3}}
               }
             ]
    end

    test "renders errors when data is invalid", %{conn: conn, answer: answer} do
      conn = put(conn, answer_path(conn, :update, answer), answer: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete answer" do
    setup [:create_answer]

    test "deletes chosen answer", %{conn: conn, answer: answer} do
      conn = delete(conn, answer_path(conn, :delete, answer))
      assert response(conn, 204)
      conn = get(conn, answer_path(conn, :show, answer))
      assert json_response(conn, 200)["data"] == []
    end
  end

  defp create_answer(_) do
    answer = fixture(:answer)
    {:ok, answer: answer}
  end
end
