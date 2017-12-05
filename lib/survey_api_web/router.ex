defmodule SurveyAPIWeb.Router do
  use SurveyAPIWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SurveyAPIWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
    resources "/surveys", SurveyController, except: [:new, :edit]
    resources "/answers", AnswerController, except: [:new, :edit]
  end
end
