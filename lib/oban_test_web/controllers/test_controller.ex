defmodule ObanTestWeb.TestController do
  use ObanTestWeb, :controller


  #Tentar resolver o pq de nao estar funcionando o :observer.start
  def test(conn, _params)do
    %{}
    |> ObanTest.Jobs.DownloadJob.new()
    |> Oban.insert()

    now = DateTime.utc_now() |> DateTime.truncate(:second)
    json(conn, %{sucess: true, now: now})
  end
end
