# WordsToInteger

Converts numbers spelled out as English words to integers.

## Installation

To use WordsToInteger in your projects, add `words_to_integer` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:words_to_integer, "~> 0.1.0"}
  ]
end
```

Then run `mix deps.get` to install it.

## Documentation

[https://hexdocs.pm/words_to_integer](https://hexdocs.pm/words_to_integer)

## Example

```elixir
WordsToInteger.convert("one hundred and sixty eight")


WordsToInteger.convert("one million eight hundred sixty-nine thousand four hundred and twenty")
```
