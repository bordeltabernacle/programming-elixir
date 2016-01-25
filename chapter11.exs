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

  {:ok, file} = File.open("sales.csv")
  IO.read(file, :line)
  Enum.each IO.stream(file, :line), &IO.write(&1)
end
