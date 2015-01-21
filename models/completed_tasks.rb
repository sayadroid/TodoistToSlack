require 'yaml'
require './lib/todoist.rb'

class CompletedTasks
  @@config = YAML::load_file(File.join(__dir__, '/../config/config.yaml'))
  @@todoist = Todoist.new

  def getCompletedTasks(day)
    completed_tasks = @@todoist.getCompletedItemsByDate(@@config['todoist']['project_id'], day)
    getCompletedTaskContents(completed_tasks, day)
  end

  def getCompletedTaskContents(tasks, day)
    day_tasks = ''
    tasks['items'].each do |task|
      if day  === Date.parse(task['completed_date']) then
        day_tasks << "* #{task["content"]} \n"
      end
    end
    if day_tasks.empty?
      day_tasks = "完了したタスクはありません。"
    end
    day_tasks
  end
end
