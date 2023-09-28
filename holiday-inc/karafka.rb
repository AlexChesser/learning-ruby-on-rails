# frozen_string_literal: true

class KarafkaApp < Karafka::App
  kafka_config = Rails.application.config_for(:kafka)
  setup do |config|
    config.kafka = {
      'bootstrap.servers': ENV.fetch("KAFKA_BOOTSTRAP_SERVERS") { kafka_config.bootstrap_servers.join(",") },
      'security.protocol': 'SASL_SSL',
      'sasl.mechanisms': 'SCRAM-SHA-512',
      'sasl.username': ENV.fetch("KAFKA_SASL_USERNAME") { kafka_config.sasl_username },
      'sasl.password': ENV.fetch("KAFKA_SASL_PASSWORD") { kafka_config.sasl_password }
    }
    config.logger = Rails.logger
    config.strict_topics_namespacing = false
    config.client_id = ENV.fetch("KAFKA_CLIENT_ID") { kafka_config.client_id }
    config.consumer_persistence = !Rails.env.development?
  end

  Karafka.monitor.subscribe(Karafka::Instrumentation::LoggerListener.new)
  Karafka.monitor.subscribe "error.occurred" do |event|
    Rails.logger.info "error in kafka #{event}"
    puts "error in kafka #{event}"
  end
  Karafka.producer.monitor.subscribe(
    WaterDrop::Instrumentation::LoggerListener.new(Karafka.logger)
  )

  routes.draw do
    consumer_group ENV.fetch("KAFKA_CONSUMER_GROUP") { kafka_config.default_consumer_group } do
      topic ENV.fetch("KAFKA_DELIVERIES_TOPIC") { kafka_config.default_topic } do
        consumer DeliveriesConsumer
      end
    end
  end
end
