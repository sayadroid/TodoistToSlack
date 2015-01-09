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

    today_tasks = ''
    uncomplete_items.each do |task|
      unless task['due_date'].nil? then
        if Date.today === Date.parse(task['due_date']) then
          today_tasks << "* #{task["content"]} \n"
        end
      end
    end
    if today_tasks.empty?
      today_tasks = "本日のタスクはありません。"
    end
    today_tasks
  end
end
