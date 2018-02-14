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

  test "register ability" do
    func1 = fn -> true end
    func2 = fn -> false end

    CanI.register(:delete, func1)
    assert CanI.abilities == %{delete: func1}

    CanI.register(:read, func2)
    assert CanI.abilities == %{delete: func1, read: func2}
  end

  test "register multiple abilities" do
    func = fn -> true end
    CanI.register([:insert, :delete], func)

    assert CanI.abilities == %{insert: func, delete: func}
  end

  test "retrieve abilities" do
    func = fn -> true end
    CanI.register(:insert, func)

    assert CanI.abilities == %{insert: func}
  end

  test "check abilities without arguments" do
    CanI.register(:insert, fn -> true end)
    CanI.register(:delete, fn -> false end)

    assert CanI.check_abilities(:insert) == true
    assert CanI.check_abilities(:delete) == false
  end

  test "check abilities with arguments" do
    #CanI.register(:insert, fn(user) -> user.admin? end)

    #assert CanI.check_abilities(:insert, user) == true
  end
end
