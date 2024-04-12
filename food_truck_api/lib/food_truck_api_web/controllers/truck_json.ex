defmodule FoodTruckApiWeb.TruckJSON do
  alias FoodTruckApi.FoodTrucks.Truck

  def index(%{trucks: trucks}) do
    %{trucks: Enum.map(trucks, &truck_json/1)}
  end

  def show(%{truck: truck}) do
    %{truck: truck_json(truck)}
  end

  def create(%{truck: truck}) do
    %{truck: truck_json(truck)}
  end

  def update(%{truck: truck}) do
    %{truck: truck_json(truck)}
  end

  def truck_json(%Truck{} = truck) do
    %{
      id: truck.id,
      location_id: truck.location_id,
      name: truck.name,
      type: truck.type,
      location: truck.location,
      address: truck.address,
      status: truck.status,
      food_items: truck.food_items,
      latitude: truck.latitude,
      longitude: truck.longitude
    }
  end
end
