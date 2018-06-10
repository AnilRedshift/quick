defmodule Mix.Tasks.Quick.Start do
  use Mix.Task

  @shortdoc "Starts a quick server"
  def run(_) do
    {:ok, _started} = Application.ensure_all_started(:quick)
    Quick.Supervisor.start_link("HELLO")
    Mix.Tasks.Run.run(["--no-halt"])
  end
end
