# gRPC Administrative minio API Specification

## Important file locations

* protobuf files are located at [api/](api/)
* swagger.json file is located at [assets/generated/swagger/api.swagger.json](assets/generated/swagger/api.swagger.json)
* Makefile is located at [build/Makefile](build/Makefile)
* Generators are located in [build/generators](build/generators)

## Record of Truth

The record of truth for the API is [api/](api/)

## Generating swagger file

To regenerate swagger, please do the following:

```bash
make -f build/Makefile generators
```

Note: you need to have `protoc` in your path.  If you're on a Mac you can run

```bash
make -f build/Makefile install-protoc-darwin
```

To install protoc for you (a password may be required to complete this operation)

There are also two plugins you will need to have installed for OpenAPI/Swagger generation. They are:

* github.com/pseudomuto/protoc-gen-doc/cmd/protoc-gen-doc
* github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger

Install with

```bash
make -f build/Makefile install-protoc-generators
```

## What is a `.proto` file?

The best source of knowledge on `.proto` files is [Google's Documentation](https://developers.google.com/protocol-buffers/)
