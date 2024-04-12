import { useQuery } from "@tanstack/react-query";
import { useParams } from "react-router-dom";
import { FoodTruckDetailItems } from "./FoodTruckDetailItems";

function useFoodTruckData(foodtruckNumber) {
  return useQuery(["trucks", foodtruckNumber], ({ signal }) => {
    return fetch(`http://localhost:4000/api/trucks/${foodtruckNumber}`, {
      signal,
    }).then((res) => res.json());
  });
}

export default function FoodTruckDetails() {
  const { number } = useParams();
  const foodtruckQuery = useFoodTruckData(number);
  const foodtrucks = foodtruckQuery.data?.truck;

  return (
    <div>
      {foodtruckQuery.isLoading ? (
        <p>Loading food truck {number}...</p>
      ) : (
        <>
          <FoodTruckDetailItems {...foodtrucks} />
        </>
      )}
    </div>
  );
}
