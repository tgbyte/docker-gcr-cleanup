#!/bin/bash -e

exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>/gcr-cleanup/cleanup.log 2>&1

for image in $(gcloud beta container images list --format='value(name)'); do
  for digest in $(gcloud beta container images list-tags "$image" --format json | jq -r '.[] | select(.tags == []) | .digest'); do
    echo gcloud beta container images delete "$image@$digest" -q
    gcloud beta container images delete "$image@$digest" -q
  done
done
