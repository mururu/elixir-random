defmodule Random do
  def seed do
    :random.seed
  end

  def seed(x, y, z) do
    :random.seed(x, y, z)
  end

  def seed({ x, y, z }) do
    :random.seed(x, y, z)
  end

  def default_seed do
    :random.seed0
  end

  def random do
    :random.uniform
  end

  def random(n) when is_integer(n) and n > 0 do
    :random.uniform(n) - 1
  end

  def random(n) when is_integer(n) do
    0
  end

  def random(n) when is_float(n) do
    random trunc(n)
  end

  def sample([]) do
    nil
  end

  def sample(list) when is_list(list) do
    :lists.nth(:random.uniform(length(list)), list)
  end

  def sample(range) when is_range(range) do
    list = Enum.to_list(range)
    sample(list)
  end

  def sample(list, n) when is_list(list) and is_integer(n) and n >= 0 do
    list = lc x inlist list, do: { :random.uniform, x }
    lc { _, x } inlist list |> :lists.sort |> :lists.sublist(n), do: x
  end

  def sample(range, n) when is_range(range) and is_integer(n) and n >= 0 do
    list = Enum.to_list(range)
    sample(list, n)
  end

  def shuffle(list) when is_list(list) do
    list = lc x inlist list, do: { :random.uniform, x }
    lc { _, x } inlist list |> :lists.sort, do: x
  end

  def shuffle(range) when is_range(range) do
    list = Enum.to_list(range)
    shuffle(list)
  end
end
