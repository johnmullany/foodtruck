import { useQuery, useQueryClient } from "@tanstack/react-query";
import fetchWithError from "../helpers/fetchWithError";
import Loader from "./Loader";
import { Link } from "react-router-dom";

export default function FoodTrucksList() {
  const queryClient = useQueryClient();
  const foodtrucksQuery = useQuery(
    ["trucks"],
    async ({ signal }) => {
      const foodtrucks = await fetchWithError(
        `http://localhost:4000/api/trucks`,
        {
          signal,
        }
      );

      foodtrucks.trucks.forEach((foodtruck) => {
        queryClient.setQueryData(
          ["trucks", foodtruck.location_id.toString()],
          foodtruck
        );
      });

      return foodtrucks;
    },
    {
      keepPreviousData: true,
    }
  );

  return (
    <div>
      <h1>
        Food Trucks{" "}
        {foodtrucksQuery.fetchStatus === "fetching" ? <Loader /> : null}
      </h1>
      <div className="foodtruckContainer flex gap-10 justify-center flex-wrap items-center py-10">
        <table>
          <thead>
            <tr>
              <th>Name</th>
              <th>Location</th>
              <th>Address</th>
            </tr>
          </thead>
          <tbody>
            {foodtrucksQuery.isLoading ? (
              <tr key="1">
                <td>Loading...</td>
              </tr>
            ) : foodtrucksQuery.isError ? (
              <tr key="1">
                <td>{foodtrucksQuery.error.message}</td>
              </tr>
            ) : (
              <>
                {foodtrucksQuery.data.trucks.map((foodtruck) => (
                  <tr key={foodtruck.id}>
                    <td>
                      <span>
                        <Link to={`trucks/${foodtruck.id}`}>
                          {foodtruck.name}
                        </Link>
                      </span>
                    </td>
                    <td>{foodtruck.location}</td>
                    <td>{foodtruck.address}</td>
                  </tr>
                ))}
              </>
            )}
          </tbody>
        </table>
      </div>
    </div>
  );
}
