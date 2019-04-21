defmodule SurveyAPI.Answers.Answer do
  @moduledoc """
  Define database table for survey answers.

  Note that the actual answers are stored as binary json, in a Postgres JSONB field.
  This provides flexibiity and allows us to store differenent surveys using the same table.

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
