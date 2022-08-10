# Aliases
alias startserver="LD_LIBRARY_PATH=/usr/local/lib valhalla_service /valhalla_tiles/valhalla.json 1"
alias setlivespeed="valhalla_traffic_demo_utils --config /valhalla_tiles/valhalla.json --update-live-traffic"
alias initserver="setlivespeed 0; startserver"