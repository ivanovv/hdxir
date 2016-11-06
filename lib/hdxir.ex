defmodule Hdxir do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(Hdxir.Endpoint, []),
      supervisor(DeviceCache.Supervisor, []),
      :poolboy.child_spec(:worker, poolboy_config, [])
    ]

    opts = [strategy: :one_for_one, name: Hdxir.Supervisor]
    Supervisor.start_link(children, opts)
  end


  defp poolboy_config do
    [{:name, {:local, :detector}},
      {:worker_module, HandsetDetection.Detector},
      {:size, :erlang.system_info(:schedulers_online)},
      {:max_overflow, 0}]
  end

  def config_change(changed, _new, removed) do
    Hdxir.Endpoint.config_change(changed, removed)
    :ok
  end
end
