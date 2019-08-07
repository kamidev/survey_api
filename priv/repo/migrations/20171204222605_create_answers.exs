defmodule SurveyAPI.Repo.Migrations.CreateAnswers do
  use Ecto.Migration

  def change do
    create table(:answers) do
      add(:pseudonym, :string)
      add(:user_id, :integer)
      add(:survey_id, :integer)
      add(:survey_answers, :jsonb)

      timestamps()
    end
  end
end
