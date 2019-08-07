defmodule SurveyAPI.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:pseudonym, :string)
      add(:user_id, :integer)

      timestamps()
    end
  end
end
