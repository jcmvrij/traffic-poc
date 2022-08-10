#!/usr/bin/env bash

# Download zuid-holland-latest.osm.pbf if its not in this directory
if ! [ -f ./zuid-holland-latest.osm.pbf ]; 
then
   wget https://download.geofabrik.de/europe/netherlands/zuid-holland-latest.osm.pbf;
fi

# Build the docker image
docker build -t valhalla-traffic-zuid-holland .;

# Starting a container based on the image
docker run -d -t --name 'valhalla-traffic-zuid-holland' -p 8002:8002 valhalla-traffic-zuid-holland;
