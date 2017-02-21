IO.puts File.stream!("d:/elixir/programming_elixir/enum/words")
        |> Enum.max_by(&String.length/1)
