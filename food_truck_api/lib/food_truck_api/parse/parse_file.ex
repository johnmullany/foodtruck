defmodule FoodTruckApi.Parse.ParseFile do
  alias FoodTruckApi.FoodTrucks

  def csv_row_to_table_record(file_path) do
    file_path
    |> File.stream!()
    |> CSV.decode!(headers: true)
    |> Enum.map(fn row ->
      row
      |> Map.new(fn {key, value} ->
        {String.to_atom(key), value}
      end)
      |> FoodTrucks.create_truck()
    end)
  end
end
