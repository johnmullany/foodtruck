# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     FoodTruckApi.Repo.insert!(%FoodTruckApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
FoodTruckApi.Parse.ParseFile.csv_row_to_table_record("priv/repo/data/food_truck_data.csv")
