defmodule MyList do
  def span(from, from), do: [from]
  def span(from, to) when from > to, do: Enum.reverse(do_span(to, from, []))
  def span(from, to), do: do_span(from, to, [])

  defp do_span(from, from, list), do: [from | list]
  defp do_span(from, to, list), do: do_span(from, to - 1, [to | list])
end
