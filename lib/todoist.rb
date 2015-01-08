require 'open-uri'
require 'json'
require 'yaml'

class Todoist
  @@config = YAML::load_file(File.join(__dir__, '/../config/config.yaml'))

  def getUncompletedItems(project_id)
    request_url = create_url('getUncompletedItems', {:token => @@config['todoist']['token'], :project_id => project_id})
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
