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

  test "register addition" do
    func1 = fn -> true end
    func2 = fn -> false end

    CanI.register(:delete, func1)
    assert CanI.abilities == %{delete: func1}

    CanI.register(:read, func2)
    assert CanI.abilities == %{delete: func1, read: func2}
  end

  test "retrieve abilities" do
    func = fn -> true end
    CanI.register(:insert, func)

    assert CanI.abilities == %{insert: func}
  end
end
