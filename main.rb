require './controller/message.rb'
require './lib/slack.rb'

message = Message.new

slack = Slack.new
slack.post_message(message.get());
