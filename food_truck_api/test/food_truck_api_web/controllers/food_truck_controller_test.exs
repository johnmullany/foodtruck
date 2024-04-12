defmodule FoodTruckApiWeb.FoodTruckControllerTest do
  use FoodTruckApiWeb.ConnCase

  import FoodTruckApi.FoodTrucksFixtures

  alias FoodTruckApi.FoodTrucks.Truck

  @create_attrs %{
    address: "some address",
    food_items: "some food_items",
    latitude: 120.5,
    location: "some location",
    location_id: 42,
    longitude: 120.5,
    name: "some name",
    status: "some status",
    type: "some type"
  }
  @update_attrs %{
    address: "some updated address",
    food_items: "some updated food_items",
    latitude: 456.7,
    location: "some updated location",
    location_id: 43,
    longitude: 456.7,
    name: "some updated name",
    status: "some updated status",
    type: "some updated type"
  }
  @invalid_attrs %{
    address: nil,
    food_items: nil,
    latitude: nil,
    location: nil,
    location_id: nil,
    longitude: nil,
    name: nil,
    status: nil,
    type: nil
  }

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all trucks", %{conn: conn} do
      conn = get(conn, ~p"/api/trucks")
      assert json_response(conn, 200)["trucks"] == []
    end
  end

  describe "create truck" do
    test "renders truck when trucks are valid", %{conn: conn} do
      conn = post(conn, ~p"/api/trucks", truck: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["truck"]

      conn = get(conn, ~p"/api/trucks/#{id}")

      assert %{
               "address" => "some address",
               "food_items" => "some food_items",
               "latitude" => 120.5,
               "location" => "some location",
               "location_id" => 42,
               "longitude" => 120.5,
               "name" => "some name",
               "status" => "some status",
               "type" => "some type"
             } = json_response(conn, 200)["truck"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/trucks", truck: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update truck" do
    setup [:create_truck]

    test "renders truck when truck is valid", %{conn: conn, truck: %Truck{id: id} = truck} do
      conn = put(conn, ~p"/api/trucks/#{truck}", truck: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["truck"]

      conn = get(conn, ~p"/api/trucks/#{id}")

      assert %{
               "id" => ^id,
               "address" => "some updated address",
               "food_items" => "some updated food_items",
               "latitude" => 456.7,
               "location" => "some updated location",
               "location_id" => 43,
               "longitude" => 456.7,
               "name" => "some updated name",
               "status" => "some updated status",
               "type" => "some updated type"
             } = json_response(conn, 200)["truck"]
    end

    test "renders errors when data is invalid", %{conn: conn, truck: truck} do
      conn = put(conn, ~p"/api/trucks/#{truck}", truck: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete truck" do
    setup [:create_truck]

    test "deletes chosen truck", %{conn: conn, truck: truck} do
      conn = delete(conn, ~p"/api/trucks/#{truck}")
      assert response(conn, 204)

      assert_error_sent(404, fn ->
        get(conn, ~p"/api/trucks/#{truck}")
      end)
    end
  end

  defp create_truck(_) do
    truck = truck_fixture()
    %{truck: truck}
  end
end
