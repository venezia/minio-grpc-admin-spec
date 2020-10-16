#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

THIS_DIRECTORY=$(dirname "${BASH_SOURCE}")
PROJECT_DIRECTORY=${THIS_DIRECTORY}/../..
DESTINATION_LIBRARY=pkg/generated/api
SWAGGER_DESTINATION=assets/generated/swagger

echo
echo "generating swagger docs for minioadmin/v1..."
echo "protoc ${PROJECT_DIRECTORY}/api/minioadmin/v1/*.proto -I ${PROJECT_DIRECTORY}/api/minioadmin/v1 -I ${PROJECT_DIRECTORY}/third_party/ --swagger_out=logtostderr=true,allow_merge=true,merge_file_name=api:${PROJECT_DIRECTORY}/${SWAGGER_DESTINATION}"
protoc ${PROJECT_DIRECTORY}/api/minioadmin/v1/*.proto -I ${PROJECT_DIRECTORY}/api/minioadmin/v1 -I ${PROJECT_DIRECTORY}/third_party/ --swagger_out=logtostderr=true,allow_merge=true,merge_file_name=api:${PROJECT_DIRECTORY}/${SWAGGER_DESTINATION}

echo
echo "generating api docs for minioadmin/v1..."
echo "protoc ${PROJECT_DIRECTORY}/api/minioadmin/v1/*.proto -I ${PROJECT_DIRECTORY}/api/minioadmin/v1 -I ${PROJECT_DIRECTORY}/third_party/ --doc_out ${PROJECT_DIRECTORY}/docs/api-generated --doc_opt=markdown,api.md"
protoc ${PROJECT_DIRECTORY}/api/minioadmin/v1/*.proto -I ${PROJECT_DIRECTORY}/api/minioadmin/v1 -I ${PROJECT_DIRECTORY}/third_party/ --doc_out ${PROJECT_DIRECTORY}/docs/api-generated --doc_opt=markdown,api.md
