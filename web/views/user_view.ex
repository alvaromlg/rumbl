defmodule Rumbl.UserView do
  use Rumbl.Web, :view
  # import model User
  alias Rumbl.User

  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
