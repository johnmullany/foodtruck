defmodule FoodTruckApiWeb.TruckController do
  use FoodTruckApiWeb, :controller

  alias FoodTruckApi.FoodTrucks
  alias FoodTruckApi.FoodTrucks.Truck

  action_fallback FoodTruckApiWeb.FallbackController

  def index(conn, %{"food_items" => food_items}) do
    trucks = FoodTrucks.get_trucks_by_food_items(food_items)
    render(conn, :index, trucks: trucks)
  end

  def index(conn, _params) do
    trucks = FoodTrucks.list_trucks()
    render(conn, :index, trucks: trucks)
  end

  def create(conn, %{"truck" => truck_params}) do
    with {:ok, %Truck{} = truck} <- FoodTrucks.create_truck(truck_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/trucks/#{truck}")
      |> render(:show, truck: truck)
    end
  end

  def show(conn, %{"id" => id}) do
    truck = FoodTrucks.get_truck!(id)
    render(conn, :show, truck: truck)
  end

  def update(conn, %{"id" => id, "truck" => truck_params}) do
    truck = FoodTrucks.get_truck!(id)

    with {:ok, %Truck{} = truck} <- FoodTrucks.update_truck(truck, truck_params) do
      render(conn, :show, truck: truck)
    end
  end

  def delete(conn, %{"id" => id}) do
    truck = FoodTrucks.get_truck!(id)

    with {:ok, _truck} <- FoodTrucks.delete_truck(truck) do
      send_resp(conn, :no_content, "")
    end
  end
end
