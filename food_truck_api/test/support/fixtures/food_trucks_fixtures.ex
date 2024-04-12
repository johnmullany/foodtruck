defmodule FoodTruckApi.FoodTrucksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FoodTruckApi.FoodTrucks` context.
  """

  @doc """
  Generate a truck.
  """
  def truck_fixture(attrs \\ %{}) do
    {:ok, truck} =
      attrs
      |> Enum.into(%{
        address: "some address",
        food_items: "some food_items",
        latitude: 120.5,
        location: "some location",
        location_id: 42,
        longitude: 120.5,
        name: "some name",
        status: "some status",
        type: "some type"
      })
      |> FoodTruckApi.FoodTrucks.create_truck()

    truck
  end
end
