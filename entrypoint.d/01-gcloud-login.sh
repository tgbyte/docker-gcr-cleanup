#!/bin/bash -e

if [[ -z "${GCLOUD_PROJECT_ID}" ]]; then
  echo "GCLOUD_PROJECT_ID must be set"
  exit 1
fi

if [[ -z "${GCLOUD_SERVICE_ACCOUNT}" ]]; then
  echo "GCLOUD_SERVICE_ACCOUNT must be set"
  exit 1
fi

if [[ -z "${GCLOUD_SERVICE_ACCOUNT_KEY}" ]]; then
  echo "GCLOUD_SERVICE_ACCOUNT_KEY must be set"
  exit 1
fi

echo "${GCLOUD_SERVICE_ACCOUNT_KEY}" > /gcr-cleanup/service-account.json
export HOME=/gcr-cleanup
su --preserve-environment -l -c "gcloud auth activate-service-account ${GCLOUD_SERVICE_ACCOUNT} --key-file /gcr-cleanup/service-account.json --project ${GCLOUD_PROJECT_ID}" gcr-cleanup
rm /gcr-cleanup/service-account.json
