defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.split(" ")
    |> Enum.reduce(
      Map.new(),
      fn word, theMap -> Map.update(theMap, word, 1, fn count -> count + 1 end) end
    )
  end
end
