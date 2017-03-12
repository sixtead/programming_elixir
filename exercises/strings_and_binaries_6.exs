defmodule MyString do

  def capitalize_sentences(string) do
    string
    |> String.split(". ")
    |> Enum.map(&down_capitalize(&1))
    |> Enum.join(". ")
  end

  defp down_capitalize(string) do
    string
    |> String.downcase
    |> String.capitalize
  end
end
