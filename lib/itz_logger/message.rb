
# The core message class
#
# The message class encapsulates a message. It creates a read-only created_at
# timestamp in utc.

require "securerandom"

require_relative "./message_type"

module ItzLogger

  class Message

    attr_reader :id, :message, :type, :created_at

    def initialize(message, type = ItzLogger::MessageType::INFO)

      @id = SecureRandom.uuid
      @message = message
      @type = type
      @created_at = Time.now.utc

    end
  end
end
