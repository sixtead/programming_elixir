defmodule Parse do

  def ascii([]), do: true
  def ascii([h|t]) when h in 32..126, do: ascii(t)
  def ascii(_), do: false

end
