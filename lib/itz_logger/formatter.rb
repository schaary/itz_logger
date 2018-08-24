
# Basic formating of messages
#
# The formatter sets a template around the message, to show the message
# type, a timestamp and maybe some coloring additional to the core of
# the message

module ItzLogger
  class Formatter

    def self.format(id, message)
      sprintf(
        "%-19s %-s8 %-#{message.type.length}s %s\n",
        message.created_at.strftime("%b %d %H:%M:%S UTC"),
        id,
        message.type.to_s.upcase,
        message.message)
    end

  end
end
