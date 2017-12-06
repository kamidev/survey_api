defmodule SurveyAPI.SurveysTest do
  use SurveyAPI.DataCase

  alias SurveyAPI.Surveys

  describe "users" do
    alias SurveyAPI.Surveys.User

    @valid_attrs %{pseudonym: "some pseudonym", user_id: 42}
    @update_attrs %{pseudonym: "some updated pseudonym", user_id: 43}
    @invalid_attrs %{pseudonym: nil, user_id: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Surveys.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Surveys.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Surveys.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Surveys.create_user(@valid_attrs)
      assert user.pseudonym == "some pseudonym"
      assert user.user_id == 42
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Surveys.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Surveys.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.pseudonym == "some updated pseudonym"
      assert user.user_id == 43
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Surveys.update_user(user, @invalid_attrs)
      assert user == Surveys.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Surveys.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Surveys.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Surveys.change_user(user)
    end
  end

  describe "surveys" do
    alias SurveyAPI.Surveys.Survey

    @valid_attrs %{name: "some name", survey_id: 42}
    @update_attrs %{name: "some updated name", survey_id: 43}
    @invalid_attrs %{name: nil, survey_id: nil}

    def survey_fixture(attrs \\ %{}) do
      {:ok, survey} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Surveys.create_survey()

      survey
    end

    test "list_surveys/0 returns all surveys" do
      survey = survey_fixture()
      assert Surveys.list_surveys() == [survey]
    end

    test "get_survey!/1 returns the survey with given id" do
      survey = survey_fixture()
      assert Surveys.get_survey!(survey.id) == survey
    end

    test "create_survey/1 with valid data creates a survey" do
      assert {:ok, %Survey{} = survey} = Surveys.create_survey(@valid_attrs)
      assert survey.name == "some name"
      assert survey.survey_id == 42
    end

    test "create_survey/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Surveys.create_survey(@invalid_attrs)
    end

    test "update_survey/2 with valid data updates the survey" do
      survey = survey_fixture()
      assert {:ok, survey} = Surveys.update_survey(survey, @update_attrs)
      assert %Survey{} = survey
      assert survey.name == "some updated name"
      assert survey.survey_id == 43
    end

    test "update_survey/2 with invalid data returns error changeset" do
      survey = survey_fixture()
      assert {:error, %Ecto.Changeset{}} = Surveys.update_survey(survey, @invalid_attrs)
      assert survey == Surveys.get_survey!(survey.id)
    end

    test "delete_survey/1 deletes the survey" do
      survey = survey_fixture()
      assert {:ok, %Survey{}} = Surveys.delete_survey(survey)
      assert_raise Ecto.NoResultsError, fn -> Surveys.get_survey!(survey.id) end
    end

    test "change_survey/1 returns a survey changeset" do
      survey = survey_fixture()
      assert %Ecto.Changeset{} = Surveys.change_survey(survey)
    end
  end
end
