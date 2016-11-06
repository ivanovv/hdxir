defmodule Hdxir.DeviceController do
  require Logger
  use Hdxir.Web, :controller

  def index(conn, %{"ua" => user_agent}) do
    device = DeviceCache.Cache.fetch(user_agent, fn ->
      HandsetDetection.Detector.get_device_by_user_agent(user_agent)
    end)
    conn
    |> put_status(:ok)
    |> put_resp_header("Content-Type", "application/json")
    |> text(device)
  end

end
