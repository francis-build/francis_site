defmodule FrancisSite do
  use Francis, static: [at: "/", from: "priv/static"]

  get("/", fn conn ->
    html = File.read!(Path.join(:code.priv_dir(:francis_site), "static/index.html"))
    html(conn, html)
  end)

  unmatched(fn _ -> "not found" end)
end
