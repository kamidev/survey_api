defmodule SurveyAPI.Repo.Migrations.AnswersAddProjectId do
  use Ecto.Migration

  def up do
    alter table(:answers) do
      add(:project_id, :string)
    end

    flush()
    SurveyAPI.Repo.update_all("answers", set: [project_id: "NOT_SET"])
  end

  def down do
    alter table(:answers) do
      remove(:project_id, :string)
    end
  end
end
