defmodule BandstockWeb.Router do
  use BandstockWeb, :router

  pipeline :browser_nouser do
      plug :accepts, ["html"]
      plug :fetch_session
      plug :fetch_flash
      plug :protect_from_forgery
      plug :put_secure_browser_headers
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug BandstockWeb.Plugs.SetUser
    #plug BandstockWeb.Plugs.CheckRegistration
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/handle", BandstockWeb do
    pipe_through :browser_nouser
    get "/update_handle", UserController, :update_handle
  end

  scope "/", BandstockWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    get "/users", UserController, :index
    get "/users/new", UserController, :new
    post "/users", UserController, :create
    get "/users/:id/edit", UserController, :edit
    get "/users/register", UserController, :register
    get "/users/:id", UserController, :show
    put "/users/:id", UserController, :update
    delete "/users/:id", UserController, :delete


    get "/tiles", TileController, :index
    get "/tiles/new", TileController, :new
    post "/tiles", TileController, :create
    get "/tiles/:id/edit", TileController, :edit
    get "/tiles/:id", TileController, :show
    put "/tiles/:id", TileController, :update
    delete "/tiles/:id", TileController, :delete
  end

  scope "/auth", BandstockWeb do
    pipe_through :browser

    get "/register", AuthController, :register
    get "/signout", AuthController, :signout
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
    post "/:provider/callback", AuthController, :callback


  end
  # Other scopes may use custom stacks.
  # scope "/api", BandstockWeb do
  #   pipe_through :api
  # end
end
