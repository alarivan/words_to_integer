defmodule WordsToIntegerTest do
  use ExUnit.Case
  doctest WordsToInteger

  test "returns correct number" do
    assert WordsToInteger.convert("zero") == {:ok, 0}
    assert WordsToInteger.convert("five") == {:ok, 5}
    assert WordsToInteger.convert("twenty") == {:ok, 20}
    assert WordsToInteger.convert("two hundred forty-six") == {:ok, 246}

    assert WordsToInteger.convert("seven hundred eighty-three thousand nine hundred and nineteen") ==
             {:ok, 783_919}

    assert WordsToInteger.convert(
             "one million eight hundred sixty-nine thousand four hundred and twenty"
           ) ==
             {:ok, 1_869_420}
  end

  test "returns error if at least one word is invalid" do
    assert WordsToInteger.convert("invalid") == {:error, :invalid_input}
    assert WordsToInteger.convert("one hundred invalid") == {:error, :invalid_input}
  end
end
