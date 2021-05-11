defmodule SurveyAPI.Answers.Answer do
  @moduledoc """
  Define database table for survey answers.

  Note that the actual answers are stored as binary json, in the JSONB field 'survey_answers'.
  This provides flexibility and allows us to store different surveys using the same table.

  The rest of the fields defined here are used to search for some set of answers.
  They cannot be changed without breaking backwards compatibily.
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias SurveyAPI.Answers.Answer

  schema "answers" do
    field(:pseudonym, :string)
    field(:survey_id, :integer)
    field(:user_id, :integer)
    field(:project_id, :string)
    field(:survey_answers, :map)

    timestamps()
  end

  @doc false
  def changeset(%Answer{} = answer, attrs) do
    answer
    |> cast(attrs, [:pseudonym, :user_id, :survey_id, :project_id, :survey_answers])
    |> validate_required([:user_id, :survey_id, :project_id, :survey_answers])
  end
end
