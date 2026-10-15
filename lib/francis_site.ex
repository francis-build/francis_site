defmodule FrancisSite do
  use Francis, static: [at: "/", from: "priv/static", gzip: true]

  # The page advertises these plugs, so it is served with them. Every asset is
  # self-hosted; the only outside origins are for Cloudflare Web Analytics,
  # whose beacon Cloudflare injects into the page at its proxy.
  # HSTS drops includeSubDomains: it would also bind other francis.build hosts.
  plug(Francis.Plug.SecureHeaders,
    headers: %{"strict-transport-security" => "max-age=63072000"}
  )

  plug(Francis.Plug.CSP,
    directives: %{
      "script-src" => "'self' https://static.cloudflareinsights.com",
      "connect-src" => "'self' https://cloudflareinsights.com"
    }
  )

  get("/", fn conn ->
    html =
      :code.priv_dir(:francis_site)
      |> Path.join("templates/index.html.eex")
      |> EEx.eval_file(
        francis_version: Application.spec(:francis, :vsn),
        tw_css: Francis.Static.static_path("tw.css"),
        app_js: Francis.Static.static_path("app.js"),
        hljs_js: Francis.Static.static_path("hljs.js"),
        hljs_elixir_js: Francis.Static.static_path("hljs_elixir.js"),
        icon_webp: Francis.Static.static_path("icon.webp"),
        favicon_ico: Francis.Static.static_path("favicon.ico"),
        ogp_png: Francis.Static.static_path("ogp.png")
      )

    html(conn, html)
  end)

  unmatched(fn _ -> "not found" end)
end
