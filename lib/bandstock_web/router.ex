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
    get "/canceled", PageController, :about

    get "/users", UserController, :index
    get "/users/:id", UserController, :show

    get "/boards/new", BoardController, :new
    get "/boards", BoardController, :index
    post "/boards", BoardController, :create
    get "/boards/:id", BoardController, :show
  end

  #resources "/boards", BoardController, except: [:new, :edit]

  scope "/admin", BandstockWeb do
    get "/", UserController, :admin
  end


    #get "/boards", BoardController, :index
#     board_path  GET     /boards/:id               BoardController :show
#     board_path  POST    /boards                   BoardController :create
# board_path  PATCH   /boards/:id               BoardController :update
#             PUT     /boards/:id               BoardController :update
# board_path  DELETE  /boards/:id               BoardController :delete

    #get "/users", UserController, :index
    #get "/users/new", UserController, :new
    #post "/users", UserController, :create
    #get "/users/:id/edit", UserController, :edit
    #get "/users/register", UserController, :register
    #get "/users/:id", UserController, :show
    #delete "/users/:id", UserController, :delete
    #put "/users/:id", UserController, :update


  scope "/board/", BandstockWeb do
    get "/link", BoardController, :link

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
