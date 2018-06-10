defmodule Quick.Root do
  use Quick.Router
  route "/" do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello, world!")
  end

  route "/cat", name: :bob do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello, kitty!")
  end
end
