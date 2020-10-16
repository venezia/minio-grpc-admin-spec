#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

THIS_DIRECTORY=$(dirname "${BASH_SOURCE}")
PROJECT_DIRECTORY=${THIS_DIRECTORY}/../..
DESTINATION_FOLDER=third_party
TEMP_FOLDER=tmp

GRPC_ECOSYSTEM_TAG=v1.14.7
GRPC_ECOSYSTEM_ZIP_DIRECTORY_TAG=1.14.7

printf "\nUpdating google api library using grpc-ecosystem $GRPC_ECOSYSTEM_TAG\n"
printf "mkdir ${PROJECT_DIRECTORY}/${TEMP_FOLDER} && rm -rf ${PROJECT_DIRECTORY}/${DESTINATION_FOLDER}/google ${PROJECT_DIRECTORY}/${DESTINATION_FOLDER}/proto-gen-swagger && \n"
printf "curl -L -o ${PROJECT_DIRECTORY}/${TEMP_FOLDER}/${GRPC_ECOSYSTEM_TAG}.zip https://github.com/grpc-ecosystem/grpc-gateway/archive/${GRPC_ECOSYSTEM_TAG}.zip && \n"
printf "unzip ${PROJECT_DIRECTORY}/${TEMP_FOLDER}/${GRPC_ECOSYSTEM_TAG}.zip \"grpc-gateway-${GRPC_ECOSYSTEM_ZIP_DIRECTORY_TAG}/third_party/*\" \"grpc-gateway-${GRPC_ECOSYSTEM_ZIP_DIRECTORY_TAG}/protoc-gen-swagger/options/*\" -d ${PROJECT_DIRECTORY}/${TEMP_FOLDER}/ && \n"
printf "mv ${PROJECT_DIRECTORY}/${TEMP_FOLDER}/grpc-gateway-${GRPC_ECOSYSTEM_ZIP_DIRECTORY_TAG}/third_party/googleapis/google ${PROJECT_DIRECTORY}/${DESTINATION_FOLDER}/google && \n"
printf "mv ${PROJECT_DIRECTORY}/${TEMP_FOLDER}/grpc-gateway-${GRPC_ECOSYSTEM_ZIP_DIRECTORY_TAG}/protoc-gen-swagger ${PROJECT_DIRECTORY}/${DESTINATION_FOLDER}/protoc-gen-swagger && \n"
printf "rm -rf ${PROJECT_DIRECTORY}/${TEMP_FOLDER} \n"

mkdir ${PROJECT_DIRECTORY}/${TEMP_FOLDER} && rm -rf ${PROJECT_DIRECTORY}/${DESTINATION_FOLDER}/google ${PROJECT_DIRECTORY}/${DESTINATION_FOLDER}/proto-gen-swagger && \
curl -L -o ${PROJECT_DIRECTORY}/${TEMP_FOLDER}/${GRPC_ECOSYSTEM_TAG}.zip https://github.com/grpc-ecosystem/grpc-gateway/archive/${GRPC_ECOSYSTEM_TAG}.zip && \
unzip ${PROJECT_DIRECTORY}/${TEMP_FOLDER}/${GRPC_ECOSYSTEM_TAG}.zip "grpc-gateway-${GRPC_ECOSYSTEM_ZIP_DIRECTORY_TAG}/third_party/*" "grpc-gateway-${GRPC_ECOSYSTEM_ZIP_DIRECTORY_TAG}/protoc-gen-swagger/options/*" -d ${PROJECT_DIRECTORY}/${TEMP_FOLDER}/ && \
mv ${PROJECT_DIRECTORY}/${TEMP_FOLDER}/grpc-gateway-${GRPC_ECOSYSTEM_ZIP_DIRECTORY_TAG}/third_party/googleapis/google ${PROJECT_DIRECTORY}/${DESTINATION_FOLDER}/google && \
mv ${PROJECT_DIRECTORY}/${TEMP_FOLDER}/grpc-gateway-${GRPC_ECOSYSTEM_ZIP_DIRECTORY_TAG}/protoc-gen-swagger ${PROJECT_DIRECTORY}/${DESTINATION_FOLDER}/protoc-gen-swagger && \
rm -rf ${PROJECT_DIRECTORY}/${TEMP_FOLDER}

printf "... updated!\n\n"
