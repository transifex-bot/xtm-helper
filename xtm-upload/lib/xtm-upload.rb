require 'xtm-upload/get-project-status-service'
require 'xtm-upload/upload-file-service'
require 'optparse'
require 'pp'

module App
  def self.compile_list_of_files(dir)
    raise "Invalid Directory Path" if not Dir.exist?(dir) 

    Dir.glob("#{dir}/*.dita")
  end

  def self.get_project_status(project_id)
    status = XtmGetProjectStatusService.new(project_id).get_status
    raise "Bad Project Id" if not status.has_key?("projectId")
    status
  end

  def self.upload_files(project_id, files)
    uploader = XtmUploadService.new(project_id)

    files.each do |f|
      puts "... Upload \"#{f}\""
      uploader.upload_file(f)
    end
  end

  def self.parse(arguments)
    options = {
      :projectid => nil,
      :dirpath   => nil
    }
    OptionParser.new do |opts|
      opts.banner = "Usage: xtm-upload.rb [options]"
      opts.on('-p', '--projectid [Integer]', 'XTM Project Id') do |value|
        options[:projectid] = value
      end
      opts.on('-d', '--dirpath [String]', 'Directory Path') do |value|
        options[:dirpath] = value
      end
      opts.on('-h', '--help', 'Show this screeen') do |v|
        puts opts
        exit
      end
    end.parse!
    options
  end

  def self.main(arguments)
    arguments << '-h' if arguments.empty?
    options = parse arguments
    if options[:projectid].nil? or options[:dirpath].nil?
      puts options
      exit
    end

    begin
      # make sure project exists by first checking project-status
      status =  get_project_status options[:projectid]

      files = compile_list_of_files options[:dirpath]
      puts files

      upload_files options[:projectid], files
    rescue StandardError => message
      puts "Error: #{message}"
    end
  end
end
