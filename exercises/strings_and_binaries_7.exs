defmodule TaxCalculator do

  def sales_tax(path) do
    {:ok, file} = File.open(path)

    [col0, col1, col2] =
      IO.read(file, :line)
      |> String.strip
      |> String.split(",")
      |> Enum.map(&String.to_atom(&1))

    IO.stream(file, :line)
    |> Stream.map(&String.strip/1)
    |> Stream.map(&String.split(&1,[",", ",:"]))
    |> Stream.map(
         fn [val0, val1, val2] ->
           [{col0, String.to_integer(val0)},
            {col1, String.to_atom(val1)},
            {col2, String.to_float(val2)}]
         end)
    |> Enum.to_list
  end

end
