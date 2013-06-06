Code.require_file "test_helper.exs", __DIR__

defmodule RandomTest do
  use ExUnit.Case

  test "random" do
    Enum.each 0..10000, fn(_) ->
      x = Random.random
      assert x >= 0.0 && x <= 1.0
    end
  end

  test "random integer" do
    Enum.each 0..10000, fn(_) ->
      assert Random.random(3) in [0,1,2]
    end
  end

  test "random negative" do
    Enum.each 0..10000, fn(_) ->
      assert Random.random(-1) == 0
    end
  end

  test "random float" do
    Enum.each 0..10000, fn(_) ->
      assert Random.random(3.2) in [0,1,2]
    end
  end

  test "sample nonempty list" do
    Enum.each 0..10000, fn(_) ->
      assert Random.sample([0,1,2]) in [0,1,2]
    end
  end

  test "sample empty list" do
    assert Random.sample([]) == nil
  end

  test "sample range" do
    Enum.each 0..10000, fn(_) ->
      assert Random.sample(1..3) in [1,2,3]
    end
  end

  test "sample list returns list" do
    Enum.each 0..10000, fn(_) ->
      list = Random.sample([0,1,2], 2)
      assert list |> Enum.sort |> Enum.all? &1 in [0,1,2]
      assert list |> Enum.uniq |> Enum.count == list |> Enum.count
    end

    Enum.each 0..10000, fn(_) ->
      list = Random.sample([0,1,2], 4)
      assert list |> Enum.sort == [0,1,2]
    end
  end

  test "sample range returns list" do
    Enum.each 0..10000, fn(_) ->
      list = Random.sample(1..3, 2)
      assert list |> Enum.sort |> Enum.all? &1 in [1,2,3]
      assert list |> Enum.uniq |> Enum.count == list |> Enum.count
    end

    Enum.each 0..10000, fn(_) ->
      list = Random.sample(1..3, 4)
      assert list |> Enum.sort == [1,2,3]
    end
  end

  test "sample with negative number" do
    assert_raise FunctionClauseError, "no function clause matching in Random.sample/2", fn ->
      Random.sample([0,1,2], -1)
    end
  end

  test "shuffle nonempty list" do
    Enum.each 0..10000, fn(_) ->
      assert Random.shuffle([0,1,2]) |> Enum.sort == [0,1,2]
    end
  end

  test "shuffle empty list" do
    assert Random.shuffle([]) == []
  end

  test "shuffle range" do
    Enum.each 0..10000, fn(_) ->
      assert Random.shuffle(1..3) |> Enum.sort == [1,2,3]
    end
  end
end
