defmodule MyString do

  def center(list) do
    longest = longest_string(list)
    list
    |> Enum.each(&IO.puts(String.pad_leading(&1, pad_for(&1, longest))))
  end

  defp longest_string(list) do
    list
    |> Enum.map(&String.length(&1))
    |> Enum.max
  end

  defp pad_for(str, longest) do
    div(longest - String.length(str), 2) + String.length(str)
  end

end
