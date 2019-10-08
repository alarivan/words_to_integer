defmodule WordsToInteger do
  @moduledoc """
  Converts numbers spelled out as English words to integers.
  """

  @words %{
    "zero" => 0,
    "one" => 1,
    "two" => 2,
    "three" => 3,
    "four" => 4,
    "five" => 5,
    "six" => 6,
    "seven" => 7,
    "eight" => 8,
    "nine" => 9,
    "ten" => 10,
    "eleven" => 11,
    "twelve" => 12,
    "thirteen" => 13,
    "fourteen" => 14,
    "fifteen" => 15,
    "sixteen" => 16,
    "seventeen" => 17,
    "eighteen" => 18,
    "nineteen" => 19,
    "twenty" => 20,
    "thirty" => 30,
    "forty" => 40,
    "fifty" => 50,
    "sixty" => 60,
    "seventy" => 70,
    "eighty" => 80,
    "ninety" => 90
  }

  @multi %{
    "hundred" => 100,
    "thousand" => 1000,
    "million" => 1_000_000
  }

  @doc """
  Converts a number spelled out as English words to an integer.

  Returns `{:ok, integer}` if string is valid, otherwise `{:error, :invalid_input}`.

  ## Examples

      iex> WordsToInteger.convert("one hundred and sixty eight")
      {:ok, 168}

      iex> WordsToInteger.convert("invalid string")
      {:error, :invalid_input}

  """
  @spec convert(binary) :: {:error, :invalid_input} | {:ok, integer}
  def convert(str) do
    words = String.split(str, ~r{\sand\s|\s|-})

    case validate(words) do
      true -> {:ok, Enum.reduce(words, 0, fn word, acc -> parse_word(word, acc) end)}
      false -> {:error, :invalid_input}
    end
  end

  @doc """
  Converts a number spelled out as English words to an integer.

  Raises `ArgumentError` if the input string is invalid.

  ## Examples

      iex> WordsToInteger.convert!("one hundred and sixty eight")
      168

      iex> WordsToInteger.convert!("invalid string")
      ** (ArgumentError) Invalid input

  """
  @spec convert!(binary) :: integer
  def convert!(str) do
    case convert(str) do
      {:ok, integer} -> integer
      {:error, :invalid_input} -> raise ArgumentError, message: "Invalid input"
    end
  end

  defp validate(words) do
    Enum.all?(words, fn word -> @words[word] || @multi[word] end)
  end

  defp parse_word(key, acc) do
    cond do
      Map.has_key?(@words, key) ->
        acc + @words[key]

      Map.has_key?(@multi, key) ->
        acc + @multi[key] * Integer.mod(acc, @multi[key]) -
          Integer.mod(acc, @multi[key])
    end
  end
end
