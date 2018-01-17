defmodule SurveyAPI.Answers.Answer do
  use Ecto.Schema
  import Ecto.Changeset
  alias SurveyAPI.Answers.Answer

  schema "answers" do
    field(:pseudonym, :string)
    field(:survey_id, :integer)
    field(:user_id, :integer)
    field(:survey_answers, :map, default: "{}")

    timestamps()
  end

  @doc false
  def changeset(%Answer{} = answer, attrs) do
    answer
    |> cast(attrs, [:pseudonym, :user_id, :survey_id, :survey_answers])
    |> validate_required([:user_id, :survey_id, :survey_answers])
  end
end
