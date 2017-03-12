defmodule Calculator do

  def calculate(expression) do
    expression |> Enum.reject(&(&1 == ?\s)) |> parse |> solve
  end

  defp parse(expression), do: _parse(expression, {0, :nil, 0})

  defp _parse([], {a, exp, b}), do: {a, exp, b}
  defp _parse([h|t], {a, exp, b})
  when h in '0123456789' and exp == :nil do
    _parse(t, {(a*10 + h - ?0), exp, b})
  end
  defp _parse([h|t], {a, _, b})
  when h in '+-*/' do
    _parse(t, {a, h, b})
  end
  defp _parse([h|t], {a, exp, b})
  when h in '0123456789' do
    _parse(t, {a, exp, b*10 + h - ?0})
  end
  defp _parse([non_digit|_], _) do
    raise "Invalid digit #{non_digit}"
  end

  defp solve({a, ?+, b}), do: a + b
  defp solve({a, ?-, b}), do: a - b
  defp solve({a, ?*, b}), do: a * b
  defp solve({a, ?/, b}), do: a / b
end
