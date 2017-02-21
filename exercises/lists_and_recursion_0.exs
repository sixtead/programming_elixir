defmodule MyList do
  def sum([]), do: 0
  def sum([head | []]), do: head
  def sum([head | tail]), do: sum([head + sum(tail) | []])
end
