
# Basic formating of messages
#
# The formatter sets a template around the message, to show the message
# type, a timestamp and maybe some coloring additional to the core of
# the message

module ItzLogger
  class Formatter

    def self.format(message)
      puts "#{message.type.to_s.upcase} |" +
        " #{message.created_at} |" +
        " #{message.message}"
    end

  end
end
