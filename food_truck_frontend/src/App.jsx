import { Route, Routes, Link, useMatch } from "react-router-dom";
import NavBar from "./components/NavBar";
import FoodTruckDetails from "./components/FoodTruckDetails";
import "./index.css";
import FoodTrucks from "./components/FoodTrucks";
function App() {
  const isRootPath = useMatch({ path: "/", end: true });
  return (
    <div className="w-[85%] m-auto bg-white">
      <div>
        <NavBar className="inline-block" />
      </div>
      {!isRootPath ? (
        <div className="text-xl text-slate-900">
          <Link to="/">Back to Food Trucks List</Link>
        </div>
      ) : (
        <span>&nbsp;</span>
      )}
      <Routes>
        <Route path="/" element={<FoodTrucks />} />
        <Route path="/trucks/:number" element={<FoodTruckDetails />} />
      </Routes>
    </div>
  );
}

export default App;
