require 'date'
require 'yaml'
require './lib/todoist.rb'

class UncompleteTasks
  @@config = YAML::load_file(File.join(__dir__, '/../config/config.yaml'))
  @@todoist = Todoist.new

  def getUncompleteTasks()
    uncomplete_items = @@todoist.getUncompletedItems(@@config['todoist']['project_id'])

    today_tasks = getOnedayUncompleteTasks(uncomplete_items, Date.today)
    tomorrow_tasks = getOnedayUncompleteTasks(uncomplete_items, Date.today+1)
    {'today' => today_tasks, 'tomorrow' => tomorrow_tasks}
  end

  def getOnedayUncompleteTasks(tasks, day)
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
