require 'xtm-upload/xtm-service-config'
require 'open3'
require 'json'
require 'pp'

class UploadFileReplyHandler
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

class XtmUploadService
  def initialize(project_id)
    @config = XtmServiceConfig.new
    @url = make_url(project_id)
    @project_id = project_id
  end

  def upload_file(filepath)
    url = make_url(@project_id)
    command_line = make_curl_command_line(url, filepath)
  
    puts command_line
  
    stdout_str, stderr_str, status = Open3.capture3(command_line)
  
    UploadFileReplyHandler.new.handle(stdout_str, stderr_str, status)
  end

  private

  def make_uri(project_id)
    "projects/#{project_id}/files/upload"
  end

  def make_url(project_id)
    uri = make_uri(project_id)
    "#{@config.base_url}/#{uri}"
  end

  def make_curl_command_line(url, filepath)
    command_line = "curl --silent " \
      "--config ~/.xtm-helper/xtm-access-token.txt " \
      "--form \"files[0].file=@#{filepath}\" " \
      "--form 'matchType=MATCH_NAMES' " \
      "#{url}"
  end
end

