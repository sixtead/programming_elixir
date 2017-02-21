prefix = fn first_string -> fn second_string -> "#{first_string} #{second_string}" end end

IO.inspect mrs = prefix.("Mrs")
IO.inspect mrs.("Smith")
IO.inspect prefix.("Elixir").("Rocks")
