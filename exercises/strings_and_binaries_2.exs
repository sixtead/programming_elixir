defmodule Anagram do

  def anagram?(word1, word2) do
    prepare_word(word1) == prepare_word(word2)
  end

  defp prepare_word(word) do
    word
    |> to_string
    |> String.downcase
    |> to_charlist
    |> Enum.filter(&(&1 in 97..122))
    |> Enum.sort
  end

end
