defmodule FoodTruckApi.FoodTrucksTest do
  use FoodTruckApi.DataCase

  alias FoodTruckApi.FoodTrucks
  alias FoodTruckApi.FoodTrucks.Truck

  describe "trucks" do
    import FoodTruckApi.FoodTrucksFixtures

    @invalid_attrs %{address: nil, food_items: nil, latitude: nil, location: nil, location_id: nil, longitude: nil, name: nil, status: nil, type: nil}

    test "list_trucks/0 returns all trucks" do
      truck = truck_fixture()
      assert FoodTrucks.list_trucks() == [truck]
    end

    test "get_truck!/1 returns the truck with given id" do
      truck = truck_fixture()
      assert FoodTrucks.get_truck!(truck.id) == truck
    end

    test "create_truck/1 with valid data creates a truck" do
      valid_attrs = %{address: "some address", food_items: "some food_items", latitude: 120.5, location: "some location", location_id: 42, longitude: 120.5, name: "some name", status: "some status", type: "some type"}

      assert {:ok, %Truck{} = truck} = FoodTrucks.create_truck(valid_attrs)
      assert truck.address == "some address"
      assert truck.food_items == "some food_items"
      assert truck.latitude == 120.5
      assert truck.location == "some location"
      assert truck.location_id == 42
      assert truck.longitude == 120.5
      assert truck.name == "some name"
      assert truck.status == "some status"
      assert truck.type == "some type"
    end

    test "create_truck/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = FoodTrucks.create_truck(@invalid_attrs)
    end

    test "update_truck/2 with valid data updates the truck" do
      truck = truck_fixture()
      update_attrs = %{address: "some updated address", food_items: "some updated food_items", latitude: 456.7, location: "some updated location", location_id: 43, longitude: 456.7, name: "some updated name", status: "some updated status", type: "some updated type"}

      assert {:ok, %Truck{} = truck} = FoodTrucks.update_truck(truck, update_attrs)
      assert truck.address == "some updated address"
      assert truck.food_items == "some updated food_items"
      assert truck.latitude == 456.7
      assert truck.location == "some updated location"
      assert truck.location_id == 43
      assert truck.longitude == 456.7
      assert truck.name == "some updated name"
      assert truck.status == "some updated status"
      assert truck.type == "some updated type"
    end

    test "update_truck/2 with invalid data returns error changeset" do
      truck = truck_fixture()
      assert {:error, %Ecto.Changeset{}} = FoodTrucks.update_truck(truck, @invalid_attrs)
      assert truck == FoodTrucks.get_truck!(truck.id)
    end

    test "delete_truck/1 deletes the truck" do
      truck = truck_fixture()
      assert {:ok, %Truck{}} = FoodTrucks.delete_truck(truck)
      assert_raise Ecto.NoResultsError, fn -> FoodTrucks.get_truck!(truck.id) end
    end

    test "change_truck/1 returns a truck changeset" do
      truck = truck_fixture()
      assert %Ecto.Changeset{} = FoodTrucks.change_truck(truck)
    end
  end
end
