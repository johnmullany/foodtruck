defmodule FoodTruckApi.Repo.Migrations.CreateFoodTrucks do
  use Ecto.Migration

  def change do
    create table(:truck) do
      add :location_id, :integer
      add :name, :string
      add :type, :string
      add :location, :string
      add :address, :string
      add :status, :string
      add :food_items, :text
      add :latitude, :float
      add :longitude, :float

      timestamps()
    end

    create index(:truck, [:latitude, :longitude])
  end
end
