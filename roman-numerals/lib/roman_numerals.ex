defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """

  # I = 1
  # V = 5
  # X = 10
  # L = 50
  # C = 100
  # D = 500
  # M = 1000

  @doc """
  [{1000, M},
  {900, CM},
  {500},
  {400},
  {100},
   {90},
   {50},
   {40},
   {10},
    {9},
    {5},
    {4},
    {1}
  ]
  https://elixirforum.com/t/iterating-over-a-lists-of-list-of-tuple/25151/2

  2978 % 1000 = 2 M
  978 %


  2978
  1978 M
  978 MM
   78 MMCM
    -
    -
   28 MMCML
   18 MMCMLX
    8 MMCMLXX
    -

  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    numberToRomanNumeralMappings = [
      {1000, "M"},
      {900, "CM"},
      {500, "D"},
      {400, "CD"},
      {100, "C"},
      {90, "XC"},
      {50, "L"},
      {40, "XL"},
      {10, "X"},
      {9, "IX"},
      {5, "V"},
      {4, "IV"},
      {1, "I"}
    ]

    # https://hexdocs.pm/elixir/Integer.html#floor_div/2
    # return if newNumber < 0
    # numberOfLetters = number(3310) / numberToRomanNumeralMappings(1000) = 3
    # newNumber =  number(3310) % numberToRomanNumeralMappings(1000) = 310
    {_, result} =
      numberToRomanNumeralMappings
      |> Enum.reduce({number, ""}, fn numeralLookup, currentState ->
        {number, romanNumeral} = numeralLookup
        {remainingNumber, currentRomanNumeral} = currentState
        newRemainder = rem(remainingNumber, number)
        stringRepeator = Integer.floor_div(remainingNumber, number)
        newNumeral = currentRomanNumeral <> String.duplicate(romanNumeral, stringRepeator)
        {newRemainder, newNumeral}
      end)

    #     |> Enum.reduce(
    #   Map.new(),
    #   fn word, theMap -> Map.update(theMap, word, 1, fn count -> count + 1 end) end
    # )
    # 9%2=
    result
  end
end
