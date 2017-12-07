defmodule SurveyAPI.Repo.Migrations.InsertSampleSurvey do
  use Ecto.Migration

  def up do
    execute """
    INSERT INTO surveys VALUES (
    1, 
    'Sample one-question survey', 
    1, 
    '{"pages": [{"title": "Sharing Cities - Product Survey", "questions": [{"name": "satisfaction", "type": "rating", "title": "How satisfied are you with the Product?", "maximumRateDescription": "Perfect", "mininumRateDescription": "Unsatisfied"}], "showProgressBar": "top"}]}', '2017-12-07', '2017-12-07');
    """
  end

  def down do
    execute """
    DELETE FROM surveys;
   """
  end

end
