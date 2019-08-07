defmodule SurveyAPI.Repo.Migrations.CreateSurveys do
  use Ecto.Migration

  def change do
    create table(:surveys) do
      add(:name, :string)
      add(:survey_id, :integer)
      add(:survey_design, :jsonb)

      timestamps()
    end
  end
end
