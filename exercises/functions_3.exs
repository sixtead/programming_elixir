fizzbuzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, a -> a
end

rem_fizz_buzz = fn n -> fizzbuzz.(rem(n, 3), rem(n, 5), n) end

IO.inspect rem_fizz_buzz.(10)
IO.inspect rem_fizz_buzz.(11)
IO.inspect rem_fizz_buzz.(12)
IO.inspect rem_fizz_buzz.(13)
IO.inspect rem_fizz_buzz.(14)
IO.inspect rem_fizz_buzz.(15)
IO.inspect rem_fizz_buzz.(16) 
