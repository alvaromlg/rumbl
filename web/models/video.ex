defmodule Rumbl.Video do
  use Rumbl.Web, :model

  schema "videos" do
    field :url, :string
    field :title, :string
    field :description, :string
    belongs_to :user, Rumbl.User
    belongs_to :category, Rumbl.Category

    timestamps()
  end

  @required_fields ~w(url title description)
  # Optional fields are no longer required for cast method
  #@optional_fields ~w(category_id)

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @required_fields)
    |> validate_required([:url, :title, :description])
    |> assoc_constraint(:category)
  end
end
