defmodule MyEnum do
  def flatten(list), do: Enum.reverse(do_flatten(list, []))

  defp do_flatten([h|[]], new_list), do: do_flatten(h, new_list)
  defp do_flatten([h|t], new_list), do: do_flatten(t, do_flatten(h, new_list))
  defp do_flatten(h, new_list), do: [h|new_list]
end
