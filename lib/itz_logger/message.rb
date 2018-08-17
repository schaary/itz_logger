
# The core message class
#
# The message class encapsulates a message.

require_relative "./message_type"

module ItzLogger

  class Message

    attr_reader :message, :type

    def initialize(message, type = ItzLogger::MessageType::INFO)

      @message = message
      @type = type
    end
  end
end
