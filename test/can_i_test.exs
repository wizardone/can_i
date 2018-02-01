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

  test "abilities addition" do
    func1 = fn -> true end
    func2 = fn -> false end

    CanI.abilities(:delete, func1)
    assert CanI.abilities == %{delete: func1}

    CanI.abilities(:read, func2)
    assert CanI.abilities == %{delete: func1, read: func2}
  end
end
