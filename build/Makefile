# protoc variables
PROTOC_VERSION=3.13.0
PROTOC_DARWIN_FILENAME=protoc-${PROTOC_VERSION}-osx-x86_64.zip
PROTOC_DARWIN_DOWNLOAD_URL=https://github.com/google/protobuf/releases/download/v${PROTOC_VERSION}/${PROTOC_DARWIN_FILENAME}

install-protoc-darwin:
	curl -L ${PROTOC_DARWIN_DOWNLOAD_URL} > /tmp/${PROTOC_DARWIN_FILENAME}
	sudo unzip -o /tmp/${PROTOC_DARWIN_FILENAME} -d /usr/local/
	rm /tmp/${PROTOC_DARWIN_FILENAME}

install-protoc-generators:
	go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
	go get -u github.com/pseudomuto/protoc-gen-doc/cmd/protoc-gen-doc

# Run the code generators for the user
generators:
	./build/generators/api.sh

third-party:
	./build/generators/third_party.sh
