from grpc.beta import implementations

import parser_pb2

_TIMEOUT_SECONDS = 10

text = ("@burnettedmond, you now support #IvoWertzel's tweet "
        "parser! https://github.com/edburnett/")

def run():
    channel = implementations.insecure_channel('localhost', 50051)
    stub = parser_pb2.beta_create_TwitterText_stub(channel)
    response = stub.Parse(parser_pb2.TweetRequest(text=text), _TIMEOUT_SECONDS)
    print 'Parser client received: %s' % response
    print 'response.users=%s' % response.users
    print 'response.tags=%s' % response.tags
    print 'response.urls=%s' % response.urls


if __name__ == '__main__':
    run()
