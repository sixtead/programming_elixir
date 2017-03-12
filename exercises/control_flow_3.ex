defmodule Control do
  def ok!(func) do
    case func do
      {:ok, data} ->
        data
      _ ->
        func
    end
  end
end
