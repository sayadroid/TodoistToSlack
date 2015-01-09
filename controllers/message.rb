require 'date'
require './models/uncomplete_tasks.rb'
require './models/completed_tasks.rb'
require './lib/slack.rb'

class Message
  @@uncomplete_tasks = UncompleteTasks.new
  @@completed_tasks = CompletedTasks.new

  def getTodayTasks()
    uncomplete_tasks = @@uncomplete_tasks.getUncompleteTasks()
    message = <<"EOS"
# 本日（#{Date.today}）のタスク
#{uncomplete_tasks['tomorrow']}
EOS
  end

  def getTomorrowTasksAndCompleyedTasks()
    uncomplete_tasks = @@uncomplete_tasks.getUncompleteTasks()
    completed_tasks = @@completed_tasks.getCompletedTasks(Date.today)
    message = <<"EOS"
# 明日（#{Date.today+1}）のタスク
#{uncomplete_tasks['tomorrow']}

# 本日（#{Date.today}） 完了したタスク
#{completed_tasks}
EOS
  end
end
