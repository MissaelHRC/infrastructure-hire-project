#!/bin/bash

BUCKET="missael-hire-project-terraform-state"
REGION="us-east-1"
KEY="aws/infrastructure_hire_project.tfstate"

terraform -chdir=terraform/ init -backend-config="bucket=${BUCKET}" -backend-config="key=${KEY}" -backend-config="region=${REGION}"