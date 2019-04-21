defmodule SurveyAPI.Application do
  @moduledoc """
  This module provides a public API for Surveyjs frontend applications
  """
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications

  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the Ecto repository
      supervisor(SurveyAPI.Repo, []),
      # Start the endpoint when the application starts
      supervisor(SurveyAPIWeb.Endpoint, [])
      # Start your own worker by calling: SurveyAPI.Worker.start_link(arg1, arg2, arg3)
      # worker(SurveyAPI.Worker, [arg1, arg2, arg3]),
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SurveyAPI.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    SurveyAPIWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
