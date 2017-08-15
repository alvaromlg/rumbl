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

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(name username), [])
    |> validate_length(:username, min: 1, max: 20)
  end

end
