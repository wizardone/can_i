defmodule CanITest do
  use ExUnit.Case
  doctest CanI

  test "greets the world" do
    assert CanI.hello() == :world
  end
end
