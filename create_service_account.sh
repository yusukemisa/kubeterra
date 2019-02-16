#!/bin/bash
SA_NAME=terraform-service-account
gcloud iam service-accounts create ${SA_NAME} --display-name ${SA_NAME}

# Grant this service account access to project
PROJECT=my-kubernetes-225704
SA_EMAIL=$(gcloud iam service-accounts list --filter="displayName:$SA_NAME" --format='value(email)')
gcloud projects add-iam-policy-binding ${PROJECT} --role roles/owner --member serviceAccount:${SA_EMAIL}

# Create the key of service account
gcloud iam service-accounts keys create .terraform-service-account.json --iam-account ${SA_EMAIL}