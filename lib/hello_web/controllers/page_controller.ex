defmodule HelloWeb.PageController do
  import Hello, only: [consulta_cep: 1]
  use HelloWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def api(conn, params) do
    %{"cep" => valor} = params
    result = Jason.decode!(consulta_cep(valor).body)

    %{
      "bairro" => bairro,
      "cep" => cep,
      "ddd" => ddd,
      "localidade" => cidade,
      "uf" => estado,
      "logradouro" => rua
    } = result

    render(conn, "api.html",
      bairro: bairro,
      cep: cep,
      ddd: ddd,
      cidade: cidade,
      estado: estado,
      rua: rua
    )
  end

  def title(conn, _params) do
    render(conn, "title.html")
  end
end
