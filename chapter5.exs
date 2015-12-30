# Functions-1
list_concat = fn(list_a, list_b) -> list_a ++ list_b end
sum = fn(a, b, c) -> a + b + c end
pair_tuple_to_list = fn({a, b}) -> [a, b] end

# Functions-2
fizzbuzz = fn
  (0, 0, _)   -> "FizzBuzz"
  (0, _, _)   -> "Fizz"
  (_, 0, _)   -> "Buzz"
  (_, _, arg) -> arg
end

# Functions-3
fizzbuzz? = fn(n) -> fizzbuzz.(rem(n,3), rem(n,5), n) end

# Functions-4
prefix = fn str_a -> fn str_b -> "#{str_a} #{str_b}" end end

# Functions-5
Enum.map [1, 2, 3, 4], &(&1 + 2)
Enum.each [1, 2, 3, 4], &IO.inspect/1
