
# Log file writer
#
# This class encapsulate the file writer of the itz_logger project.

require_relative "./message"
require_relative "./formatter"

module ItzLogger
  class LogFile

    @log_level = nil
    @log_id = nil
    @log_file_handle = nil

    @error_flag = false
    @error_reason = nil

    attr_reader :log_level

    def initialize(
      log_level = ItzLogger::MessageType::INFO,
      log_file = './log/logfile.log',
      log_id = nil)

      @log_level = log_level
      @log_id = log_id

      create_and_open_log_file(log_file)
      check_error
    end

    def write(log_level, message)

      # stop here, iff there is no file to write into
      return nil if check_error

      # stop here, iff the message is not importand enough
      return nil if !ItzLogger::MessageType.equals(@log_level, log_level)

      log_message = ItzLogger::Message.new(message, log_level)

      File.write(
        @log_file_handle,
        ItzLogger::Formatter.format(
          @log_id,
          log_message),
        mode: 'a')
    end

    def log_level=(log_level)
      if ItzLogger::MessageType::TYPES.include?(log_level)
        @log_level = log_level
      end
    end

    private

    def check_error
      if @error_reason == true
        STDERR.puts @error_reason
      end

      @error_flag
    end


    # create or/and open the log file
    def create_and_open_log_file(log_file)
      # check existance of the given file
      # and do we have permission to write
      if File.exist?(log_file)
        if File.writable_real?(log_file)
          @log_file_handle = File.open(log_file, 'a')
          @log_file_handle.sync = true
        else
          @error_flag = true
          @error_reason = "[ERROR] can't open log file for writing!"
        end
      else
        path = File.dirname(log_file)
        _filename = File.basename(log_file)

        # check whether the path to the log file exists and is writable
        #
        # if not, try to create the path
        if Dir.exist?(path)

          if File.writable_real?(path)
            begin
              @log_file_handle = File.open(log_file, 'w')
              @log_file_handle.sync = true
            rescue
              @error_flag = true
              @error_reason = "[error] can't create log file"
            end

          else
            @error_flag = true
            @error_reason = "[error] can't create log file #{log_file}"
          end

        else

          begin
            FileUtils.mkdir_p(path)
            @log_file_handle = File.open(log_file, 'w')
            @log_file_handle.sync = true
          rescue
            @error_flag = true
            @error_reason = "[error] can't create log file #{log_file}"
          end

        end
      end
    end
  end
end
