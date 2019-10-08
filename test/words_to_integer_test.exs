defmodule WordsToIntegerTest do
  use ExUnit.Case
  doctest WordsToInteger

  describe "convert" do
    test "returns correct number" do
      assert WordsToInteger.convert("zero") == {:ok, 0}
      assert WordsToInteger.convert("five") == {:ok, 5}
      assert WordsToInteger.convert("twenty") == {:ok, 20}
      assert WordsToInteger.convert("two hundred forty-six") == {:ok, 246}

      assert WordsToInteger.convert(
               "seven hundred eighty-three thousand nine hundred and nineteen"
             ) ==
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

  describe "convert!" do
    test "returns correct number" do
      assert WordsToInteger.convert!("zero") == 0
      assert WordsToInteger.convert!("five") == 5
      assert WordsToInteger.convert!("twenty") == 20
      assert WordsToInteger.convert!("two hundred forty-six") == 246

      assert WordsToInteger.convert!(
               "seven hundred eighty-three thousand nine hundred and nineteen"
             ) ==
               783_919

      assert WordsToInteger.convert!(
               "one million eight hundred sixty-nine thousand four hundred and twenty"
             ) ==
               1_869_420
    end

    test "raises ArgumentError if at least one word is invalid" do
      assert_raise ArgumentError, "Invalid input", fn -> WordsToInteger.convert!("invalid") end

      assert_raise ArgumentError, "Invalid input", fn ->
        WordsToInteger.convert!("one hundred invalid")
      end
    end
  end
end
