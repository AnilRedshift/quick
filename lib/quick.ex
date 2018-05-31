defmodule Quick do
  @moduledoc """
  Documentation for Quick.
  """
  use Application
  def start(_type, _args) do
    Quick.Supervisor.start_link("HELLO")
  end
end
