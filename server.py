import time

from ttp import ttp

import parser_pb2

_ONE_DAY_IN_SECONDS = 60 * 60 * 24

p = ttp.Parser()


class Parser(parser_pb2.BetaTwitterTextServicer):

    def Parse(self, request, context):
        print 'Received message: %s' % request
        result = p.parse(request.text)
        return parser_pb2.ParsedResponse(users=result.users,
                                         tags=result.tags,
                                         urls=result.urls)


def serve():
    server = parser_pb2.beta_create_TwitterText_server(Parser())
    server.add_insecure_port('[::]:50051')
    server.start()
    try:
        while True:
            time.sleep(_ONE_DAY_IN_SECONDS)
    except KeyboardInterrupt:
        server.stop(0)


if __name__ == '__main__':
    serve()
