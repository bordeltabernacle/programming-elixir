# StringsAndBinaries-1..5
defmodule Eleven do

	def all_ascii?(char_list) do
    char_list
    |> Enum.all?(&ascii?/1)
  end

  def ascii?(c) when 32 < c and c < 126, do: true
  def ascii?(_), do: false

  def anagram?(word1, word2) do
    {sort(word1), sort(word2)}
    |> _same?
  end

  defp sort(word) do
    word
    |> to_char_list
    |> Enum.sort
  end
  defp _same?({word, word}), do: true
  defp _same?({_, _}), do: false

  def calculate(calculation) do
    calculation
    |> Enum.chunk_by(&ascii?/1)
    |> _calculate
  end

  defp _calculate([a, _, '+', _, b]) do
    List.to_integer(a) + List.to_integer(b)
  end
  defp _calculate([a, _, '-', _, b]) do
    List.to_integer(a) - List.to_integer(b)
  end
  defp _calculate([a, _, '*', _, b]) do
    List.to_integer(a) * List.to_integer(b)
  end
  defp _calculate([a, _, '/', _, b]) do
    List.to_integer(a) / List.to_integer(b)
  end

  def center(list_of_words) do
    width = list_of_words
    |> Enum.max_by(&String.length/1)
    |> String.length

    list_of_words
    |> Enum.map(fn (word) ->
      ws = div(width - String.length(word), 2)
      IO.puts(String.duplicate(" ", ws) <> word) end)
  end

  def capitalize_sentences(str) do
    str
    |> String.split(~r{\.\s+})
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(". ")
  end
end

defmodule Bookshelf do

  @tax_rates [NC: 0.075, TX: 0.08]

  def sales_tax(orders) do
    for order <- orders, do: sales_tax_order(order)
  end

  def sales_tax_order([id: id, ship_to: ship_to, net_amount: net]) do
    total = net * (Keyword.get(@tax_rates, ship_to, 0) + 1)
    [id: id, ship_to: ship_to, net_amount: net, total: total]
  end

  def parse_sales_file(file) do
    {:ok, file} = File.open(file)
    _headers = IO.read(file, :line)
    IO.stream(file, :line)
    |> Stream.map(&String.strip/1)
    |> Stream.map(&String.split(&1, ","))
    |> Stream.map(&Enum.zip([:id, :ship_to, :net_amount], &1))
    |> Stream.map(&Keyword.update!(&1, :id, fn(item) ->
        String.to_integer(item) end))
    |> Stream.map(&Keyword.update!(&1, :ship_to, fn(item) ->
        String.to_atom(String.slice(item, 1..2)) end))
    |> Stream.map(&Keyword.update!(&1, :net_amount, fn(item) ->
        String.to_float(item) end))
    |> sales_tax
  end
end
