defmodule MyList do
  def caesar([], _) do
    []
  end
  def caesar(list, n) when n >= 26 do
    caesar(list, rem(n, 26))
  end
  def caesar([head | tail], n) when head + n > ?z do
    [head + n - ?z + ?a | caesar(tail, n)]
  end
  def caesar([head | tail], n) do
    [head + n | caesar(tail, n)]
  end
end
