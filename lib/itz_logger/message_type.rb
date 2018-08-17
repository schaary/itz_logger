
# Types of the log messages

module ItzLogger
  class MessageType
    INFO = :info
    DEBUG = :debug
    WARN = :warn
    VERBOSE = :verbose

    TYPES = [INFO, DEBUG ,WARN, VERBOSE]

    @hierarchies = [
      info: [:info],
      debug: [:info, :debug],
      warn: [:info, :debug, :warn],
      verbose: [:info, :debug, :warn, :verbose]
    ]

    def self.equals(current_level, message_type)
      @hierarchies[0][current_level].include?(message_type)
    end
  end
end
