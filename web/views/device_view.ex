defmodule Hdxir.DeviceView do
  use Hdxir.Web, :view

  def render("index.json", %{devices: devices}) do
    %{data: render_many(devices, Hdxir.DeviceView, "device.json")}
  end

  def render("show.json", %{device: device}) do
    %{data: render_one(device, Hdxir.DeviceView, "device.json")}
  end

  def render("device.json", %{device: device}) do
    %{id: device.id}
  end
end
