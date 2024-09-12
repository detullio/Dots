./scripts/sitl/launch_sitl_containers.sh -t docker -l logs/AutomatedTests -m AutomatedTests/4-uav-lawnmower/4-uav-lawnmower_1/config.sh	

./scripts/gcs/launchMavproxy.sh launch -t docker

python test/arcade-tools/proxy_ardupilot_host/start_ardupilot_process.py -vehicle_id_list '54,62,63,64' -host_ip '172.30.0.1' -dest_ip SITL -mission_path 'misc/mavproxy/Flight0_staging.waypoints'

