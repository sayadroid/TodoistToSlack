require './controllers/message.rb'
require './lib/slack.rb'

message = Message.new

slack = Slack.new
# 本日のタスク通知
slack.post_message(message.getTodayTasks());
# 本日完了したタスクと明日のタスクセット通知（使うときは下記１行のコメントアウト外してください）
# slack.post_message(message.getTomorrowTasksAndCompleyedTasks());
