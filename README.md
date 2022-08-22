Valhalla is a versatile routing engine. It can take live or historical traffic data sources into account while calculating the route. \
Traffic Influenced Routing is not supported yet. There is very little documentation on it. \
This project recreates examples in [this](https://valhalla.readthedocs.io/en/latest/thor/simple_traffic/) article and shows how traffic data is used by valhalla to influence routing.

This project builds an traffic enabled valhalla docker image. (see Dockerfile)

Resources:
Building valhalla from source: https://github.com/gis-ops/tutorials/tree/master/valhalla \
Traffic Influenced Routing information: https://valhalla.readthedocs.io/en/latest/thor/simple_traffic/ \
Traffic Influenced Routing explanation: \
https://gis-ops.com/traffic-in-valhalla/ \
https://github.com/alinmindroc/valhalla_traffic_poc \

To create the docker image and start a container:

1. Download [zuid-holland-latest.osm.pbf](https://download.geofabrik.de/europe/netherlands/zuid-holland-latest.osm.pbf) to this directory.
2. Build the docker image `docker build -t valhalla-traffic-zuid-holland .`
3. Start the container `docker run -d -t --name 'valhalla-traffic-zuid-holland' -p 8002:8002 valhalla-traffic-zuid-holland`

Starting the valhalla server:

1. Connect to the container `docker exec -it valhalla-traffic-zuid-holland bash`
2. In the container, start the server `initserver`
   Now you can see predicted traffic applied to this way: https://www.openstreetmap.org/way/127838917

Manipulating live speed:

1. Connect to the container `docker exec -it valhalla-traffic-zuid-holland bash`
2. In the container, use the command `setlivespeed XX` to manipulate live speed on this way: https://www.openstreetmap.org/way/127838917

demo pagina to experiment with \
https://valhalla.github.io/demos/routing/index-internal.html#loc=17,52.106093,4.323276
