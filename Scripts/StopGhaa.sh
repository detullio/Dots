./scripts/gcs/launchMavproxy.sh clean -t docker
./scripts/sitl/clean_sitl_containers.sh
docker stop gcs_soi_spoofer_relay
