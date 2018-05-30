defmodule Quick do
  @moduledoc """
  Documentation for Quick.
  """
  use Application
  def start(_type, _args) do
    Confex.resolve_env!(:quick)
    Supervisor.start_link(children(), strategy: :one_for_one, name: Quick.Supervisor)
  end

  defp children() do
    scheme = get_env(:scheme)
    port = get_env(:port)
    IO.puts("Starting on #{scheme}://localhost:#{port}/")
    [
      {Plug.Adapters.Cowboy2, scheme: scheme, plug: Quick.Root, options: [port: port]}
    ]
  end

  defp get_env(name), do: Application.get_env(:quick, name)
end
