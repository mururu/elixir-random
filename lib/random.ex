defmodule Random do
  @moduledoc """
  A wrapper for the random module of Erlang.
  This module is not cryptographically strong as the random
  module of Erlang.
  """

  @doc """
  Seeds random number generation with default (fixed) values
  in the process dictionary, and returns the old state.
  """
  def seed do
    :random.seed
  end

  @doc """
  Seeds random number generation with integer values in the
  process dictionary, and returns the old state.

  ## Examples

      iex> { x, y, z } = :erlang.now
      iex> Random.seed(x, y, z)

  """
  def seed(x, y, z) do
    :random.seed(x, y, z)
  end

  @doc """
  `Random.seed({x, y, z) is equivalent to `Random.seed(z, y, y)`.
  """
  def seed({ x, y, z }) do
    :random.seed(x, y, z)
  end

  @doc """
  Returns the default seed.
  """
  def default_seed do
    :random.seed0
  end

  @doc """
  Returns a random float uniformly distributed  between `0.0`
  and `1.0`, updating the state in the process dictionary.

  ## Examples

      iex> Random.random
      0.44358461744572030838

  """
  def random do
    :random.uniform
  end

  @doc """
  Returns a random integer uniformly distributed between `0`
  and `n - 1` and updates the state in the process dictionary
  in case of `n >= 1`, otherwise returns 0.

  ## Examples

      iex> Random.random(3)
      1

  """
  def random(n) when is_integer(n) and n > 0 do
    :random.uniform(n) - 1
  end

  def random(n) when is_integer(n) do
    0
  end

  def random(n) when is_float(n) do
    random trunc(n)
  end

  @doc """
  Returns a radom element from the list or the range in case
  that it is not empty and updates the state  in the process
  dictionary, otherwise returns nil.

  ## Examples

      iex> Random.sample([1,2,3])
      2

  """
  def sample([]) do
    nil
  end

  def sample(list) when is_list(list) do
    :lists.nth(:random.uniform(length(list)), list)
  end

  def sample(%Range{} = range) do
    list = Enum.to_list(range)
    sample(list)
  end

  @doc """
  Returns a list of `n` random elements from the list or the range.
  Also updates the state in the process dictionary.

  ## Examples

    iex> Random.sample([1,2,3], 2)
    [3,1]

  """
  def sample(list, n) when is_list(list) and is_integer(n) and n >= 0 do
    list = for x <- list, do: { :random.uniform, x }
    for { _, x } <- (list |> :lists.sort |> :lists.sublist(n)), do: x
  end

  def sample(%Range{} = range, n) when is_integer(n) and n >= 0 do
    list = Enum.to_list(range)
    sample(list, n)
  end

  @doc """
  Shuffles the list ot the range.
  Also updates the state in the process dictionary.

  ## Examples

      iex> Random.shuffle([1,2,3])
      [2,1,3]

  """
  def shuffle(list) when is_list(list) do
    list = for x <- list, do: { :random.uniform, x }
    for { _, x } <- (list |> :lists.sort), do: x
  end

  def shuffle(%Range{} = range) do
    list = Enum.to_list(range)
    shuffle(list)
  end
end
