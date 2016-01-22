# ListsAndRecursion-5
defmodule MyEnum do

  def all?([], _), do: true
  def all?([h|t], fun) do
    case fun.(h) do
      true  -> all?(t, fun)
      false -> false
    end
  end


  def each([], _), do: :ok
  def each([h|t], fun) do
    fun.(h)
    each(t, fun)
  end


  def filter(enumerable, fun), do: _filter(enumerable, fun, [])

  defp _filter([], _, acc), do: reverse acc
  defp _filter([h|t], fun, acc) do
    case fun.(h) do
      true  -> _filter(t, fun, [h|acc])
      false -> _filter(t, fun, acc)
    end
  end


  def reverse(enumerable), do: _reverse(enumerable, [])

  defp _reverse([], acc), do: acc
  defp _reverse([h|t], acc) do
    _reverse(t, [h|acc])
  end


  def split(enumerable, count) when count < 0 do
    _split(enumerable, count + length(enumerable), [])
  end
  def split(enumerable, count) do
    _split(enumerable, count, [])
  end

  defp _split([h|t], count, acc) when length(acc) < count do
    _split(t, count, [h|acc])
  end
  defp _split(enumerable, _, acc) do
    {reverse(acc), enumerable}
  end


  def count([]),    do: 0
  def count([_|t]), do: 1 + count(t)


  def take(enumerable, count) when count < 0 do
    _take(enumerable, count + length(enumerable), [])
  end
  def take(enumerable, count) do
    _take(enumerable, count, [])
  end


  defp _take([h|t], count, acc) when length(acc) < count do
    _take(t, count, [h|acc])
  end
  defp _take(enumerable, _, _), do: enumerable
end


# ListsAndRecursion-6
defmodule MyList do
  def flatten(ll), do: _flatten(ll, [])

  defp _flatten([h|t], acc) when is_list(h) do
    _flatten(h, _flatten(t, acc))
  end
  defp _flatten([h|t], acc), do: [h|_flatten(t, acc)]
  defp _flatten([], acc),    do: MyEnum.reverse acc
end


# ListsAndRecursion-7
defmodule Prime do

  def span(a, b) when a <= b, do: [a|span(a + 1, b)]
  def span(_, _), do: []

  def numbers(n) do
    for m <- span(2, n),
    Enum.all?(span(2, m - 1), &rem(m, &1) != 0),
    do: m
  end
end


# LIstsAndRecursion-8
defmodule Bookshelf do

  @tax_rates [NC: 0.075, TX: 0.08]

  def orders() do
    [[id: 123, ship_to: :NC, net_amount: 100.00],
     [id: 124, ship_to: :OK, net_amount:  35.50],
     [id: 125, ship_to: :TX, net_amount:  24.00],
     [id: 126, ship_to: :TX, net_amount:  44.80],
     [id: 127, ship_to: :NC, net_amount:  25.00],
     [id: 128, ship_to: :MA, net_amount:  10.00],
     [id: 129, ship_to: :CA, net_amount: 102.00],
     [id: 120, ship_to: :NC, net_amount:  50.00]]
  end

  def sales_tax(orders) do
    for [id: id, ship_to: ship_to, net_amount: net_amount] <- orders,
    total_amount = net_amount * (Keyword.get(@tax_rates, ship_to, 0) + 1),
    do: [id: id, ship_to: ship_to, net_amount: net_amount, total_amount: total_amount]
  end
end
