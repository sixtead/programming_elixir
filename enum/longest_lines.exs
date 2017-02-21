IO.puts File.read!("D:/elixir/programming_elixir/enum/words")
        |> String.split
        |> Enum.max_by(&String.length/1)
