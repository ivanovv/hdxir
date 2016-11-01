defmodule Hdxir.Router do
  use Hdxir.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

   scope "/", Hdxir do
     pipe_through :api
     get "/", DeviceController, :index
   end
end
