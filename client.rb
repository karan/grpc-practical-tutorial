this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'parser_services'

def main
  stub = Twittertext::TwitterText::Stub.new('localhost:50051', :this_channel_is_insecure)
  response = stub.parse(Twittertext::TweetRequest.new(text: "@burnettedmond, you now support #IvoWertzel's tweet parser! https://github.com/edburnett/"))
  puts "#{response.inspect}"
  puts "response.users=#{response.users}"
  puts "response.tags=#{response.tags}"
  puts "response.urls=#{response.urls}"
end

main
