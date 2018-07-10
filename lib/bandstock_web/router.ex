defmodule BandstockWeb.Router do
  use BandstockWeb, :router

  pipeline :browser_nouser do
      plug :accepts, ["html"]
      plug :fetch_session
      plug :fetch_flash
      plug :protect_from_forgery
      plug :put_secure_browser_headers
  end

  #pipeline :browser do
  #  plug :accepts, ["html"]
  #  plug :fetch_session
  #  plug :fetch_flash
  #  plug :protect_from_forgery
  #  plug :put_secure_browser_headers
  #  plug BandstockWeb.Plugs.SetUser
  #  #plug BandstockWeb.Plugs.CheckRegistration
  #end

  pipeline :api do
    plug :accepts, ["json"]
  end

  #scope "/handle", BandstockWeb do
    #pipe_through :browser_nouser
    #get "/update_handle", UserController, :update_handle

  #end

  scope "/", BandstockWeb do
    pipe_through :browser_nouser # Use the default browser stack

    get "/", PageController, :index
    get "/about", PageController, :about
    get "/signout", AuthController, :signout
    get "/sold_out", PageController, :about
    get "/red_founder", PageController, :about

    #get "/users", UserController, :index
    #get "/users/new", UserController, :new
    #post "/users", UserController, :create
    #get "/users/:id/edit", UserController, :edit
    #get "/users/register", UserController, :register
    #get "/users/:id", UserController, :show
    #delete "/users/:id", UserController, :delete
    #put "/users/:id", UserController, :update
  end

  scope "/auth", BandstockWeb do
    pipe_through :browser_nouser

    get "/register", AuthController, :register
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
    post "/:provider/callback", AuthController, :callback
  end

  #scope "/tile", BandstockWeb do
    #pipe_through :browser
    #get "/index", TileController, :index
    #get "/heap", TileController, :heap
  #end

  # Other scopes may use custom stacks.
  # scope "/api", BandstockWeb do
  #   pipe_through :api
  # end
end
