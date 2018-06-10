defmodule Quick.Router do

  def call(module, %Plug.Conn{} = conn, routes) do
    match = get_route(routes, conn)
    Kernel.apply(module, match, [conn])
  end

  defp get_route(routes, %{request_path: request_path}) do
    Enum.find(routes, fn
      {pattern, _} when is_binary(pattern) -> request_path == pattern
      _ -> false
    end)
    |> elem(1)
  end

  defp create_name(pattern, options) do
    method = Keyword.get(options, :method, :get)
    String.to_atom("#{method}_#{pattern}")
  end

  defmacro __using__(_options) do
    quote do
      import Plug.Conn
      import Quick.Router, only: [route: 2, route: 3]
      @before_compile Quick.Router

      @routes []
      def init(options), do: options

      def call(conn, _opts) do
        Quick.Router.call(__MODULE__, conn, routes())
      end
    end
  end

  defmacro route(pattern, options \\ [], block) do
    name = Keyword.get_lazy(options, :name, fn -> create_name(pattern, options) end)
    route = {pattern, name}
    quote do
      @routes [unquote(route) | @routes]
      def unquote(name)(var!(conn)) do
        [do: resp] = unquote(block) # Unknown right now why this is wrapped in a do:
        resp
      end
    end
  end

  defmacro __before_compile__(_env) do
    quote do
      defp routes, do: @routes
    end
  end

end
