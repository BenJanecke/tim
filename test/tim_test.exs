defmodule TimTest do
  use ExUnit.Case
  doctest Tim

  test "greets the world" do
    assert Tim.hello() == :world
  end
end
