require './controllers/message.rb'
require './lib/slack.rb'

message = Message.new

slack = Slack.new
slack.post_message(message.getTodayTasks());
# slack.post_message(message.getTomorrowTasksAndCompleyedTasks());
