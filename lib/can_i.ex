defmodule CanI do
  @moduledoc """
  Documentation for CanI.
  """

  def start_link do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def register(ability, func) when is_atom(ability) do
    Agent.update(__MODULE__, fn abilities -> Map.put(abilities, ability, func) end)
  end

  def register(abilities, func) when is_list(abilities) do
    Enum.each(abilities, fn ability ->
      Agent.update(__MODULE__, fn abilities -> Map.put(abilities, ability, func) end)
    end)
  end

  def abilities do
    Agent.get(__MODULE__, fn state -> state end)
  end

  def check_abilities(ability, params) do
    Map.get(abilities(), ability).(params)
  end

  def check_abilities(ability) do
    Map.get(abilities(), ability).()
  end
end
