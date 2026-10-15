defmodule FrancisSite do
  use Francis, static: [at: "/", from: "priv/static", gzip: true]

  get("/", fn conn ->
    html =
      :code.priv_dir(:francis_site)
      |> Path.join("templates/index.html.eex")
      |> EEx.eval_file(
        tw_css: Francis.Static.static_path("tw.css"),
        icon_png: Francis.Static.static_path("icon.png"),
        favicon_ico: Francis.Static.static_path("favicon.ico"),
        ogp_png: Francis.Static.static_path("ogp.png")
      )

    html(conn, html)
  end)

  unmatched(fn _ -> "not found" end)
end
