defmodule LiveViewStudio.Myapi do
  alias LiveViewStudio.Utilita

  @host "http://192.168.24.71/"

  def home do
    get_url @host
  end

  def stazioni do
    get_url  @host <> "stazioni"
  end

  def sar do
    get_url  @host <> "sar"
  end

  def sasi do
    get_url @host  <> "sasi"
  end

  def get_url(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
        |> Jason.decode!
        |> Utilita.convert_lista_atom_keys
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

end
