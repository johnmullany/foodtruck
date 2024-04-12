# Food Truck Frontend, Backend, API and Postgres DB
To start the project:

  * You need to have docker installed. Directions are at the following url `https://docs.docker.com/engine/install/`
  * Run `docker compose up` to create a docker container with the necessary images
  * It should automatically start the browser on port 8000 but you may have to open a browser and go to `http://localhost:8000`

When finished:
  * Run `docker compose down`

To run Elixir API Test:
  * cd into the food_truck_api directory
  * Run `MIX_ENV=test mix test` which currently runs 16 tests

Thanks,
John
