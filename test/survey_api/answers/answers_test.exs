defmodule SurveyAPI.AnswersTest do
  use SurveyAPI.DataCase

  alias SurveyAPI.Answers

  describe "answers" do
    alias SurveyAPI.Answers.Answer

    @valid_attrs %{
      pseudonym: "some pseudonym",
      survey_id: 42,
      user_id: 42,
      survey_answers: %{"Quality" => %{"affordable" => 2}}
    }
    @update_attrs %{
      pseudonym: "some updated pseudonym",
      survey_id: 43,
      user_id: 43,
      survey_answers: %{"Quality" => %{"affordable" => 2}}
    }
    @invalid_attrs %{pseudonym: nil, survey_id: nil, user_id: nil}

    def answer_fixture(attrs \\ %{}) do
      {:ok, answer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Answers.create_answer()

      answer
    end

    test "list_answers/0 returns all answers" do
      answer = answer_fixture()
      assert Answers.list_answers() == [answer]
    end

    test "get_answer!/1 returns the answer with given id" do
      answer = answer_fixture()
      assert Answers.get_answer!(answer.id) == answer
    end

    test "create_answer/1 with valid data creates a answer" do
      assert {:ok, %Answer{} = answer} = Answers.create_answer(@valid_attrs)
      assert answer.pseudonym == "some pseudonym"
      assert answer.survey_id == 42
      assert answer.survey_answers == %{"Quality" => %{"affordable" => 2}}
      assert answer.user_id == 42
    end

    test "create_answer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Answers.create_answer(@invalid_attrs)
    end

    test "update_answer/2 with valid data updates the answer" do
      answer = answer_fixture()
      assert {:ok, answer} = Answers.update_answer(answer, @update_attrs)
      assert %Answer{} = answer
      assert answer.pseudonym == "some updated pseudonym"
      assert answer.survey_answers == %{"Quality" => %{"affordable" => 2}}
      assert answer.survey_id == 43
      assert answer.user_id == 43
    end

    test "update_answer/2 with invalid data returns error changeset" do
      answer = answer_fixture()
      assert {:error, %Ecto.Changeset{}} = Answers.update_answer(answer, @invalid_attrs)
      assert answer == Answers.get_answer!(answer.id)
    end

    test "delete_answer/1 deletes the answer" do
      answer = answer_fixture()
      assert {:ok, %Answer{}} = Answers.delete_answer(answer)
      assert_raise Ecto.NoResultsError, fn -> Answers.get_answer!(answer.id) end
    end

    test "change_answer/1 returns a answer changeset" do
      answer = answer_fixture()
      assert %Ecto.Changeset{} = Answers.change_answer(answer)
    end
  end
end
