# Python client
protoc  -I protos/ --python_out=. --grpc_out=. --plugin=protoc-gen-grpc=`which grpc_python_plugin` protos/parser.proto

# Ruby
protoc -I protos/ --ruby_out=lib --grpc_out=lib --plugin=protoc-gen-grpc=`which grpc_ruby_plugin` protos/parser.proto
