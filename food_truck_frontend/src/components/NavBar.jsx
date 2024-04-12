import React from "react";
import FetchingIndicator from "../components/FetchingIndicator";

function NavBar() {
  return (
    <div className="navBar flex justify-between items-center p-[3rem]">
      <div className="logoDiv">
        <div className="logo text-[25px] text-blueColor flex">
          <div className="pr-4">
            <strong>FoodTruck</strong>Search
          </div>
          <FetchingIndicator />
        </div>
      </div>
    </div>
  );
}

export default NavBar;
