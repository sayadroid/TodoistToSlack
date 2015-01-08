require 'uri'
require 'net/http'
require 'yaml'

class Slack
  @@config = YAML::load_file(File.join(__dir__, '/../config/config.yaml'))

  def post_message(text)
    `curl -F "token=#{@@config['slack']['token']}" -F "channel=#{@@config['slack']['channel']}" -F "username=#{@@config['slack']['user_name']}" -F "text=#{text}" -F "icon_emoji=>#{@@config['slack']['icon_emoji']}" https://slack.com/api/chat.postMessage`
  end
end
