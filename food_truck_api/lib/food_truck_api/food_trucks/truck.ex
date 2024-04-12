defmodule FoodTruckApi.FoodTrucks.Truck do
  use Ecto.Schema
  import Ecto.Changeset

  schema "truck" do
    field(:address, :string)
    field(:food_items, :string)
    field(:latitude, :float)
    field(:location, :string)
    field(:location_id, :integer)
    field(:longitude, :float)
    field(:name, :string)
    field(:status, :string)
    field(:type, :string)

    timestamps()
  end

  @doc false
  def changeset(truck, attrs) do
    truck
    |> cast(attrs, [
      :location_id,
      :name,
      :type,
      :location,
      :address,
      :status,
      :food_items,
      :latitude,
      :longitude
    ])
    |> validate_required([
      :location_id,
      :name,
      :type,
      :location,
      :address,
      :status,
      :food_items,
      :latitude,
      :longitude
    ])
  end
end
