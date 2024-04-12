import axios from "axios";
import React, { useEffect, useState } from "react";
import { AiOutlineSearch } from "react-icons/ai";

function FoodTruckSearch() {
  // const [foodTrucks, setFoodTrucks] = useState([]);
  const [searchTerm, setSearchTerm] = useState("");

  const fetchFoodTrucks = async (cuisine) => {
    const response = await axios.get(
      `http://localhost:4000/api/trucks?food_items=${cuisine}`
    );

    setFoodTrucks(response.data.trucks);
  };

  useEffect(() => {
    if (searchTerm) {
      fetchFoodTrucks(searchTerm);
    }
  }, [searchTerm]);

  return (
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
  );
}

export default FoodTruckSearch;
