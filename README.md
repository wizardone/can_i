# CanI

Simple authorization system for Elixir based applications.

Define your abilities like so:

```elixir
# Add abilities
CanI.register(:read, fn(user) -> user.regular? end)
CanI.register(:delete, fn(user) -> user.admin? end)

CanI.abilities
#=> [{:read, function}, {:delete, function}]
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `can_i` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:can_i, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/can_i](https://hexdocs.pm/can_i).
