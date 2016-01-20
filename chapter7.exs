# ListsAndRecursion-0..4
defmodule MyList do

  def sum([]), do: 0
  def sum([h|t]), do: h + sum(t)

  def map([], _), do: []
  def map([h|t], func), do: [func.(h)|map(t, func)]

  def mapsum(list, func) do
    list
    |> map(func)
    |> sum
  end

  def max([h|t]), do: _max(t, h)

  defp _max([], acc), do: acc
  defp _max([h|t], acc) when h > acc, do: _max(t, h)
  defp _max([h|t], acc) when h < acc, do: _max(t, acc)

  def caesar(char_list, n) do
    char_list
    |> map(&_caesar(&1, n))
  end

  defp _caesar(c, n) when (c + n) > 122 do
    _caesar(96 + (c - 122), n)
  end
  defp _caesar(c, n), do: c + n

  def span(a, b) do
    _span(a, b)
  end

  defp _span(a, b) when a <= b do
    [a | _span(a + 1, b)]
  end
  defp _span(_a, _b), do: []
end


