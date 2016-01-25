# ModulesAndFunctions-1..3
defmodule Times do
	def double(n), do: n * 2
  def triple(n), do: n * 3
  def quadruple(n), do: n |> double |> double
end

# ModulesAndFunctions-4..5
defmodule Math do
  def sum(1), do: 1
	def sum(n), do: n + sum(n - 1)

  def gcd(x, 0) when x > 0, do: x
  def gcd(x, y) when x > 0 and y > 0, do: gcd(y, rem(x, y))
end

# ModulesAndFunctions-6
defmodule Chop do
	def guess(actual, a..b), do: _guess(actual, a..b, div(a + b, 2))

  defp _guess(actual, _range, actual), do: actual
  defp _guess(actual, a.._, guess) when guess > actual do
    guess(actual, a..guess - 1)
  end
  defp _guess(actual, _..b, guess) when guess < actual do
    guess(actual, guess + 1..b)
  end
end


