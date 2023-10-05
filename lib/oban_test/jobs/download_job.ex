defmodule ObanTest.Jobs.DownloadJob do
  use Oban.Worker, queue: :downloads

  @impl Oban.Worker
  def perform(_) do
    IO.inspect("entrou na funcao anonima")

    mb_1 = "https://browiki.org/images/a/ab/Arte_Cavaleiros_R%C3%BAnicos.png"

    {:ok, %{body: body}} = HTTPoison.get(mb_1, [], [recv_timeout: 50000]) |> IO.inspect()

    File.write("RuneKnight.png", body)
  end
end
