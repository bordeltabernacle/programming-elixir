# ControlFlow-1
defmodule FizzBuzz do
  def upto(n) when n > 0 do
    1..n |> Enum.map(&fizzbuzz/1)
  end

  def fizzbuzz(n) do
    case n do
      n when rem(n, 3) == 0 and rem(n, 5) == 0 ->
        "FizzBuzz"
      n when rem(n, 3) == 0 ->
        "Fizz"
      n when rem(n, 5) == 0 ->
        "Buzz"
      _ ->
        n
    end
  end
end

# ControlFlow-3
defmodule OK do
  def ok!({:ok, data}), do: data
  def ok!({_, msg}), do: raise "Error: #{msg}"
end
