defmodule Quick.Supervisor do
  @moduledoc """
  Documentation for Quick.
  """
  def start_link(routes) do
    Supervisor.start_link(children(routes), strategy: :one_for_one, name: __MODULE__)
  end

  defp children(routes) do
    scheme = get_env(:scheme)
    port = get_env(:port)
    plug = { Quick.Root, routes: routes }
    IO.puts("Starting on #{scheme}://localhost:#{port}/")
    [
      {Plug.Adapters.Cowboy2, scheme: scheme, plug: plug, options: [port: port]}
    ]
  end

  defp get_env(name), do: Confex.get_env(:quick, name)
end
