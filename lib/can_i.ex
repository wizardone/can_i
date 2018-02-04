defmodule CanI do
  @moduledoc """
  Documentation for CanI.
  """

  def start_link do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def register(ability, func) do
    Agent.update(__MODULE__, fn abilities -> Map.put(abilities, ability, func) end)
  end

  def abilities do
    Agent.get(__MODULE__, fn state -> state end)
  end
end
