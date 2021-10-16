defmodule HelloWeb.PageControllerTest do
  use HelloWeb.ConnCase

  test "GET /api/", %{conn: conn} do
    conn = get(conn, "/api/")
    assert html_response(conn, 200) =~ "<h2>Coloque o CEP como no exemplo:</h2>"
  end

  test "Result GET /api/69035350" do
    conn = get(build_conn(), "/api/69035350")
    assert html_response(conn, 200) =~ "Compensa" and html_response(conn, 200) =~ "Manaus"
  end

  test "error of Result GET /api/69035350" do
    conn = get(build_conn(), "/api/69035350")
    refute html_response(conn, 200) =~ "Alvorada" and html_response(conn, 200) =~ "Manacapuru"
  end
end
