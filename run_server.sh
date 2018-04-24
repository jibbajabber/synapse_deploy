#!/usr/bin/env bash


mkdir data && cd data
python -m synapse.app.homeserver --server-name journeyman \
                                 --config-path homeserver.yaml \
                                 --generate-config \
                                 --report-stats=no
/usr/local/bin/synctl start


while [ 1 ]; do
  sleep 1
done
