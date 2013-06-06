# Random module for Elixir

[![Build Status](https://travis-ci.org/mururu/elixir-random.png?branch=master)](https://travis-ci.org/mururu/elixir-random)

A Elixir wrapper for the random module of Erlang.

This is not cryptographically strong as the random module of Erlang.

## Examples

```elixir
iex> Random.random
0.44358461744572030838
iex> Random.random(3)
1
iex> Random.sample([1,2,3])
2
iex> Random.sample([1,2,3], 2)
[3,1]
iex> Random.shuffle([1,2,3])
[2,1,3]
```
