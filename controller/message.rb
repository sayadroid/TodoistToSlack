require 'date'
require 'yaml'
require './lib/todoist.rb'
require './lib/slack.rb'

class Message

  def get()
    tasks = getTasks()
    message = <<"EOS"
# #{Date.today}のタスク
#{tasks}
EOS
  end

  def getTasks()
    config = YAML::load_file(File.join(__dir__, '/../config/config.yaml'))
    todoist = Todoist.new
    uncomplete_items = todoist.getUncompletedItems(config['todoist']['project_id'])

    getOnedayTasks(uncomplete_items, Date.today)
  end

  def getOnedayTasks(tasks, day)
    day_tasks = ''
    tasks.each do |task|
      unless task['due_date'].nil? then
        if day === Date.parse(task['due_date']) then
          day_tasks << "* #{task["content"]} \n"
        end
      end
    end
    if day_tasks.empty? then
      day_tasks = "タスクはありません。"
    end
    day_tasks
  end
end
