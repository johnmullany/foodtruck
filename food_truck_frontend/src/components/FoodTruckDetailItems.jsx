export const FoodTruckDetailItems = ({
  id,
  name,
  type,
  location,
  address,
  status,
  food_items,
}) => {
  return (
    <div>
      <div className="wrapper mt-10">
        <table>
          <thead>
            <tr>
              <th>Name</th>
              <th>Type</th>
              <th>Location</th>
              <th>Address</th>
              <th>Status</th>
              <th>Food Items</th>
            </tr>
          </thead>
          <tbody>
            <tr key={id}>
              <td>
                <span>{name}</span>
              </td>
              <td>{type}</td>
              <td>{location}</td>
              <td>{address}</td>
              <td>{status}</td>
              <td>{food_items}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  );
};
