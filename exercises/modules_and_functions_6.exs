defmodule Chop do
  def guess(n, n.._), do: n
  def guess(n, _..n), do: n
  def guess(n, a..b) do
    m = middle(a..b)
    IO.puts "Is it #{m}"
    guess(n, a..m, m..b)
  end

  def guess(n, _..n, n.._), do: n
  def guess(n, a..m, m.._) when n in a..m, do: guess(n, a..m)
  def guess(n, _..m, m..b) when n in m..b, do: guess(n, m..b)

  def middle(a..b), do: (a + b) |> div(2)
end
