defmodule XML do

  def get(location) do
    HTTPoison.get("http://w1.weather.gov/xml/current_obs/#{location}.xml")
  end

  def handle_response({:ok, response}) do
    {:ok, response}
  end
  def handle_response({:error, %HTTPoison.Error{id: _, reason: reason}}) do
    {:error, reason}
  end

  def get_content({:ok, %{status_code: 200, body: body}}) do
    {:ok, body}
  end
  def get_content({:ok, %{status_code: 404, body: _}}) do
    {:error, "no such location"}
  end
  def get_content({:error, reason}) do
    {:error, reason}
  end

  def parse({:ok, body}, fields) do
    fields
    |> Enum.map(&get_field_content(body, &1))
  end
  def parse({:error, reason}, _fields) do
    {:error, reason}
  end

  def get_field_content(body, field) do
    {:ok, pattern} = Regex.compile("<#{field}>(.+)<\/#{field}>")
    content = Regex.run(pattern, body) |> List.last
    {String.to_atom(field), content}
  end

  def print({:error, reason}) do
    IO.puts "Sorry, but there was a #{reason} error"
  end
  def print(list) do
    max_len = list |> Keyword.keys |> Enum.map(&to_string/1) |> Enum.max_by(&String.length/1) |> String.length
    list
    |> Enum.each(fn {k, v} -> IO.puts "#{String.pad_trailing(Atom.to_string(k) <> ":", max_len)}\t" <> "#{v}" end)
  end
end
