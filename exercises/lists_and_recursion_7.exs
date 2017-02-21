defmodule Primes do
  def prime(to), do: Enum.reverse(do_span(2, to, []))

  defp do_span(from, to, list) when from > to, do: list
  defp do_span(from, to, list) do
    case (for x <- list, rem(from, x) == 0, do: x) do
      [] ->
        do_span(from + 1, to, [from|list])
      _  ->
        do_span(from + 1, to, list)
    end
  end
end
