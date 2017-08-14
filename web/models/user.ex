defmodule Rumbl.User do
  use Rumbl.Web, :model

  # DSL built with schema and field Elixir macros
  # :id automatic primary key like Django
  schema "users" do
    field :name, :string
    field :username, :string
    # virtual field for password
    # it's an intermediate field for password hash
    # virtual fields are not persisted to the database
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps
  end
end
