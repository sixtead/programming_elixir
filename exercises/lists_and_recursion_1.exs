defmodule MyList do
  def mapsum([], _) do
    []
  end
  def mapsum([head | list], func) do
    [head | list]
    |> map(func)
    |> sum
  end

  defp map([], _), do: []
  defp map([head | tail], func), do: [func.(head) | map(tail, func)]

  defp sum([]), do: []
  defp sum([head | []]), do: head
  defp sum([head | tail]), do: sum([head + sum(tail) | []])
end
