defmodule HandsetDetection.Detector do

  use GenServer
  use Export.Python

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, [], opts)
  end

  def init(_opts) do
    {:ok, py} = Python.start(python_path: Path.expand("lib/python"))
    {:ok, %{python_process: py}}
  end

  def get_device_by_user_agent(user_agent) do
    case GenServer.call(__MODULE__, {:detect, user_agent}) do
      result -> result
    end
  end

  def terminate(_, state) do
    %{python_process: py} = state
    py.stop()
  end

  def handle_call({:detect, user_agent}, _from, state) do
   %{python_process: py} = state
    result = py |> Python.call("hd_service", "detect", [user_agent])
    {:reply, result, state}
  end

  def handle_cast(_msg, state) do
    {:noreply, state}
  end
end