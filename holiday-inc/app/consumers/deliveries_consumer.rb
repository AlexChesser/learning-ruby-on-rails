# frozen_string_literal: true

# Example consumer that prints messages payloads
class DeliveriesConsumer < ApplicationConsumer
  # def initialize
  #   Rails.logger.info "DeliveriesConsumer initialize"
  # end

  def consume
    Rails.logger.info "consuming messages"
    messages.each { |message|
      Rails.logger.info message.raw_payload
      event = Event.new({ payload: message.raw_payload })
      event.save
    }
  end

  # # Run anything upon partition being revoked
  # def revoked
  #   Rails.logger.info "DeliveriesConsumer revoked"
  # end

  # # Define here any teardown things you want when Karafka server stops
  # def shutdown
  #   Rails.logger.info "DeliveriesConsumer shutdown (rails logger)"
  # end
end