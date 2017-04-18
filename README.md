# Google Container Registry Cleanup

Cleans up untagged images from the Google Container Registry. Configuration
happens via three environment variables that need to be supplied during
container creation:

* `GCLOUD_PROJECT_ID`: The Google Cloud project ID
* `GCLOUD_SERVICE_ACCOUNT`: The email address of the service account to use
* `GCLOUD_SERVICE_ACCOUNT_KEY`: The Google Cloud service account secret in JSON format
