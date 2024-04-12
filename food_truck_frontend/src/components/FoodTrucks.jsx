import React, { useState, useEffect } from "react";
import { useQuery, useQueryClient } from "@tanstack/react-query";
import fetchWithError from "../helpers/fetchWithError";
import { Link } from "react-router-dom";
import { AiOutlineSearch } from "react-icons/ai";

function FoodTrucks() {
  const [searchTerm, setSearchTerm] = useState([]);

  const queryClient = useQueryClient();
  let queryUrl = `http://localhost:4000/api/trucks`;
  if (searchTerm) {
    queryUrl = `http://localhost:4000/api/trucks?food_items=${searchTerm}`;
  }
  const foodtrucksQuery = useQuery(
    ["trucks", queryUrl],
    async ({ signal }) => {
      const foodtrucks = await fetchWithError(queryUrl, {
        signal,
      });

      foodtrucks.data?.trucks.forEach((foodtruck) => {
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

  useEffect(() => {
    if (searchTerm) {
      foodtrucksQuery;
    }
  }, [searchTerm]);

  const truncateString = (str, num) => {
    if (str.length > num) {
      return str.substring(0, num - 3) + "...";
    } else {
      return str;
    }
  };

  const numberFoodTrucks = foodtrucksQuery.data?.trucks.length;
  const countLabel = numberFoodTrucks === 1 ? "truck" : "trucks";
  let numberFoodTrucksLabel = `You've found ${numberFoodTrucks} food ${countLabel}. Click on card for more info`;

  if (numberFoodTrucks === undefined) {
    numberFoodTrucksLabel = `We didn't find any food trucks for you.`;
  }

  return (
    <>
      <div className="searchDiv grid gap-10 bg-gray-300 rounded-[10px] p-[1rem]">
        <div className="firstDiv flex  justify-between items-center rounded-[8px] gap-[10px] bg-white p-5 shadow-lg shadow-grayIsh-700">
          <div className="flex gap-2 items-center">
            <AiOutlineSearch className="text-[25px] icon" />
            <input
              type="text"
              className="bg-transparent text-blue-500 focus:outline-none w-96"
              placeholder="Search by Cuisine Here...."
              onChange={(event) => setSearchTerm(event.target.value)}
            />
          </div>
        </div>
      </div>
      <div>{numberFoodTrucksLabel}</div>
      <div className="foodtruckContainer mt-10 flex gap-10 justify-center flex-wrap items-center py-18">
        {foodtrucksQuery.data?.trucks.map(
          ({ id, name, food_items, address }) => {
            if (food_items.length > 90) {
              food_items = truncateString(food_items, 90);
            }

            if (name.length > 30) {
              name = truncateString(name, 30);
            }
            return (
              <Link key={id} to={`/trucks/${id}`}>
                <div
                  key={id}
                  className="group group/item singleFoodtruck h-[250px] w-[250px] p-[20px] bg-gray-200 rounded-[10px] hover:bg-blueColor shadow-lg shadow-grayIsh-400/700 hover:shadow-lg"
                >
                  <span className="flex justify-between items-center gap-4">
                    <h1 className="text-[16px] font-semibold text-textColor group-hover:text-white">
                      {name}
                    </h1>
                  </span>

                  <p className="text-[13px] text-[#959595] pt-[20px] border-t-[2px] mt-[20px] group-hover:text-white">
                    {address}
                  </p>
                  <small className="text-[#959595] group-hover:text-white">
                    {food_items}
                  </small>
                </div>
              </Link>
            );
          }
        )}
      </div>
    </>
  );
}

export default FoodTrucks;
