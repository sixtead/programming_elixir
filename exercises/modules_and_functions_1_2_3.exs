defmodule Times do
  def double(n), do: n * 2
# ModulesAndFunctions-1
  def triple(n), do: n * 3
# ModulesAndFunctions-3
  def quadruple(n), do: n |> double |> double
end
