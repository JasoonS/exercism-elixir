# https://elixirschool.com/en/lessons/basics/strings/

defmodule Bob do
  def hey(input) do
    trimmedString = String.trim(input)

    # https://github.com/vnegrisolo/cheat-sheet-elixir#cond
    cond do
      trimmedString == "" ->
        "Fine. Be that way!"

      trimmedString =~ ~r(^[^a-z]*$) ->
        cond do
          String.at(trimmedString, String.length(trimmedString) - 1) == "?" ->
            "Calm down, I know what I'm doing!"

          true ->
            "Whoa, chill out!"
        end

      # https://hexdocs.pm/elixir/String.html#at/2
      true ->
        cond do
          String.at(trimmedString, String.length(trimmedString) - 1) == "?" ->
            "Sure."

          true ->
            "Whatever."
        end
    end
  end
end
