defmodule HelloWeb.HelloControllerTest do
  use HelloWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end

  test "GET /hello", %{conn: conn} do
    conn = get(conn, "/hello")
    assert html_response(conn, 200) =~ "<h2>Hello World, from Phoenix!</h2>"
  end

  test "GET /hello/erick", %{conn: conn} do
    conn = get(conn, "/hello/erick")
    assert html_response(conn, 200) =~ "<h2>Hello, erick!</h2>"
  end

  test "error in GET /hello/erick", %{conn: conn} do
    conn = get(conn, "/hello/erick")
    refute html_response(conn, 200) =~ "<h2>Hello, amorim!</h2>"
  end
end
