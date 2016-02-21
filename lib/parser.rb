# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: parser.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "twittertext.TweetRequest" do
    optional :text, :string, 1
  end
  add_message "twittertext.ParsedResponse" do
    repeated :users, :string, 1
    repeated :tags, :string, 2
    repeated :urls, :string, 3
  end
end

module Twittertext
  TweetRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("twittertext.TweetRequest").msgclass
  ParsedResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("twittertext.ParsedResponse").msgclass
end
