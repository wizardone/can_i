defmodule CanITest do
  use ExUnit.Case
  doctest CanI

  setup do
    CanI.start_link
    :ok
  end

  test "abilities" do
    assert CanI.abilities == %{}
  end
end
