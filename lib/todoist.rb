require 'open-uri'
require 'json'
require 'yaml'

class Todoist
  @@config = YAML::load_file(File.join(__dir__, '/../config/config.yaml'))

  def getUncompletedItems(project_id)
    request_url = create_url('getUncompletedItems', {:token => @@config['todoist']['token'], :project_id => project_id})
    api_request(request_url)
  end

  # Return items with a complete date same or older than from_date
  # (formated as "2007-4-29T10:13").
  def getCompletedItemsByDate(project_id, from_date)
    request_url = create_url('getAllCompletedItems', {:token => @@config['todoist']['token'], :project_id => project_id, :from_date => from_date})
    api_request(request_url)
  end

  def api_request(request_url)
    res = open(request_url)
    code, message = res.status

    if code == '200'
      return JSON.parse(res.read)
    end
  end

  def create_url(action, params)
    @@config['todoist']['api_url'] + action + '?' + URI.encode_www_form(params)
  end
end
