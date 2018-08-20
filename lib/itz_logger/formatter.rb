
# Basic formating of messages
#
# The formatter sets a template around the message, to show the message
# type, a timestamp and maybe some coloring additional to the core of
# the message

module ItzLogger
  class Formatter

    def self.format(message)
      printf(
        "%-20s %-#{message.type.length}s %s\n",
        message.created_at.strftime("%b %d %H:%M:%S UTC"),
        message.type.to_s.upcase,
        message.message)
    end

  end
end
