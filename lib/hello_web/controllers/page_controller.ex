defmodule HelloWeb.PageController do
  import Hello, only: [consulta_cep: 1]
  use HelloWeb, :controller

  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, _params) do
    render(conn, "index.html")
  end

  @spec test(Plug.Conn.t(), any) :: Plug.Conn.t()
  def test(conn, params) do
    json(conn, params)
  end

  def api(conn, params) do
    %{"cep" => valor} = params
    json(conn, Jason.decode!(~s(#{consulta_cep(valor).body})))
  end
end
