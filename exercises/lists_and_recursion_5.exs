defmodule MyEnum do
  def all?([], _func), do: true
  def all?([h|t], func) do
    if func.(h), do: all?(t, func), else: false
  end

  def each([], _func), do: []
  def each([h|t], func), do: [func.(h)|each(t, func)]

  def filter([], _func), do: []
  def filter([h|t], func) do
    if func.(h), do: [h|filter(t, func)], else: filter(t, func)
  end

  def split(list, count) do
    cond do
      count >= 0 ->
        do_split([], list, count)
      count + len(list) > 0 ->
        do_split([], list, count + len(list))
      true ->
        {[], list}
    end
  end
  defp do_split(list_one, list_two, 0), do: {rev(list_one), list_two}
  defp do_split(list, [], _count), do: {rev(list), []}
  defp do_split(list, [h|t], count), do: do_split([h|list], t, count - 1)

  def take(list, count) do
    {list_one, list_two} = split(list, count)
    if count >= 0, do: list_one, else: list_two
  end

  defp rev(list), do: do_reverse(list, [])
  defp do_reverse([], new_list), do: new_list
  defp do_reverse([h|t], new_list), do: do_reverse(t, [h|new_list])

  defp len(list), do: do_length(list, 0)
  defp do_length([], count), do: count
  defp do_length([_h|t], count), do: do_length(t, count + 1)
end
