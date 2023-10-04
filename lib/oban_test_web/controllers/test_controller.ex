defmodule ObanTestWeb.TestController do
  use ObanTestWeb, :controller


  #Tentar resolver o pq de nao estar funcionando o :observer.start
  def test(conn, _params)do

    Task.start_link(fn ->
      IO.inspect("entrou na funcao anonima")

      mb_1 = "https://browiki.org/images/a/ab/Arte_Cavaleiros_R%C3%BAnicos.png"

      {:ok, %{body: body}} = HTTPoison.get(mb_1, [], [recv_timeout: 50000]) |> IO.inspect()

      File.write("mb1.png", body)
    end)

    now = DateTime.utc_now() |> DateTime.truncate(:second)
    json(conn, %{sucess: true, now: now})
  end
end
