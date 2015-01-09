require 'date'
require './models/uncomplete_tasks.rb'
require './models/completed_tasks.rb'
require './lib/slack.rb'

class Message
  @@uncomplete_tasks = UncompleteTasks.new
  @@completed_tasks = CompletedTasks.new

  def getTodayTasks()
    today = Date.today
    uncomplete_tasks = @@uncomplete_tasks.getUncompleteTasks(today)

    message = <<"EOS"
# 本日（#{today}）のタスク
#{uncomplete_tasks['tomorrow']}
EOS
  end

  def getTomorrowTasksAndCompleyedTasks()
    today = Date.today
    tomorrow = Date.today+1

    uncomplete_tasks = @@uncomplete_tasks.getUncompleteTasks(tomorrow)
    completed_tasks = @@completed_tasks.getCompletedTasks(today)

    message = <<"EOS"
# 明日（#{tomorrow}）のタスク
#{uncomplete_tasks['tomorrow']}

# 本日（#{today}） 完了したタスク
#{completed_tasks}
EOS
  end
end
