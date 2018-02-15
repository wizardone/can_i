# CanI
[![Build Status](https://travis-ci.org/wizardone/can_i.svg?branch=master)](https://travis-ci.org/wizardone/can_i)

Simple authorization system for Elixir based applications.

Define your abilities like so:

```elixir
# Start the agent
CanI.start_link
# Add abilities
CanI.register(:read, fn user -> user.regular? end)
CanI.register(:delete, fn user -> user.admin? end)

# Add multiple abilities
CanI.register([:insert, :delete], fn user -> user.admin? end)

CanI.abilities
#=> [{:read, function}, {:delete, function}]

# Fetch a user record from a database
CanI.check_ability(:delete, user)
=> true
# Or if there are not arguments involved for the anonymous function
CanI.register(:read, fn -> true end)
CanI.check_abilities(:read)
=> false
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
