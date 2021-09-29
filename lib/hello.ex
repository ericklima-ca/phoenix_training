defmodule Hello do
  import HTTPoison

  @moduledoc """
  Hello keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  @url "https://viacep.com.br/ws/{}/json/"
  def consulta_cep(cep) do
    @url
    |> String.replace("{}", cep)
    |> get!()
  end
end
