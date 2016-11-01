defmodule Hdxir do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(Hdxir.Endpoint, []),
      supervisor(DeviceCache.Supervisor, []),
      supervisor(HandsetDetection.Supervisor, [])
    ]

    opts = [strategy: :one_for_one, name: Hdxir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    Hdxir.Endpoint.config_change(changed, removed)
    :ok
  end
end
