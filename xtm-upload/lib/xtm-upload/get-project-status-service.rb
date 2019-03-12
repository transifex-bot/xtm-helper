require 'xtm-upload/xtm-service-config'
require 'open3'
require 'json'
require 'pp'

class GetProjectStatusReplyHandler
  def handle(stdout_str, stderr_str, status)
    if status.success?
      json_data = JSON.parse(stdout_str)
      # pp json_data
    else
      puts "stderr_str: #{stderr_str}"
      {}
    end
  end
end

class XtmGetProjectStatusService
  def initialize(project_id)
    @config = XtmServiceConfig.new
    @project_id = project_id
    @url = make_url(project_id)
  end

  def get_status
    command_line = make_curl_command_line(@url)
  
    puts command_line
  
    stdout_str, stderr_str, status = Open3.capture3(command_line)
  
    GetProjectStatusReplyHandler.new.handle(stdout_str, stderr_str, status)
  end

  private

  def make_url(project_id)
    "#{@config.base_url}/projects/#{project_id}/status"
  end

  def make_curl_command_line(url)
    command_line = "curl --silent " \
      "--config ~/.xtm-helper/xtm-access-token.txt " \
      "#{url}"
  end
end

