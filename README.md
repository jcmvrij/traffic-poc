Valhalla is a versatile routing engine. It can take live or historical traffic data sources into account while calculating the route. \
Traffic Influenced Routing is not supported yet. There is very little documentation on it. \
This project recreates exmaples in [this](https://valhalla.readthedocs.io/en/latest/thor/simple_traffic/) article and shows how traffic data is used by valhalla to influence routing.

Resources:
Building valhalla from source: https://github.com/gis-ops/tutorials/tree/master/valhalla \
Traffic Influenced Routing information: https://valhalla.readthedocs.io/en/latest/thor/simple_traffic/ \
Traffic Influenced Routing explanation: \
https://gis-ops.com/traffic-in-valhalla/ \
https://github.com/alinmindroc/valhalla_traffic_poc \

Process:

1. Download [zuid-holland-latest.osm.pbf](https://download.geofabrik.de/europe/netherlands/zuid-holland-latest.osm.pbf) to this directory.
2. Build the docker image `docker build -t valhalla-traffic-zuid-holland .`
3. Start the container `docker run -d -t --name 'valhalla-traffic-zuid-holland' -p 8002:8002 valhalla-traffic-zuid-holland`
4. Connect to the container `docker exec -it valhalla-traffic-zuid-holland bash`
5. In the container, start the server `initserver`

Now you can see predicted traffic aplied to this way: https://www.openstreetmap.org/way/127838917

oude waalsdorperweg \
curl http://localhost:8002/locate --data '{"locations": [{"lat": 52.105116, "lon": 4.318969}], "verbose": true}' | jq

demo pagina \
https://valhalla.github.io/demos/routing/index-internal.html#loc=17,52.106093,4.323276

normal routing
https://valhalla.github.io/demos/routing/index-internal.html#loc=16,52.106960,4.324590&directionsoptions={%22language%22:%22en-US%22}&directionsoptions={%22language%22:%22en-US%22}&datetime={%22type%22:0}&locations=[{%22lat%22:52.10919366812656,%22lon%22:4.327279552817345},{%22lat%22:52.102241513177,%22lon%22:4.317217580974102}]&costing=%22auto%22
