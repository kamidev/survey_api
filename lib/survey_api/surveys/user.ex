defmodule SurveyAPI.Surveys.User do
  @moduledoc """
  This module is currently unused, since we don't store detailed user information
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias SurveyAPI.Surveys.User

  schema "users" do
    field(:pseudonym, :string)
    field(:user_id, :integer)

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:pseudonym, :user_id])
    |> validate_required([:pseudonym, :user_id])
  end
end
