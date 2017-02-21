IO.puts File.open!("d:/elixir/programming_elixir/enum/words")
       |> IO.stream(:line)
       |> Enum.max_by(&String.length/1)
