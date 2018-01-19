defmodule SurveyAPI.Surveys.Survey do
  use Ecto.Schema
  import Ecto.Changeset
  alias SurveyAPI.Surveys.Survey

  schema "surveys" do
    field(:name, :string)
    field(:survey_id, :integer)
    field(:survey_design, :map)
    timestamps()
  end

  @doc false
  def changeset(%Survey{} = survey, attrs) do
    survey
    |> cast(attrs, [:name, :survey_id, :survey_design])
    |> validate_required([:name, :survey_id])
  end
end
