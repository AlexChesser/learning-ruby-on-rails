class Delivery < ApplicationRecord
  belongs_to :customer, class_name: "User"
  belongs_to :assigned_to, class_name: "User"
  belongs_to :destination, class_name: "Country"
  has_one :invoice
  before_validation :assign_before_validation
  after_save :send_delivery_event

  def send_delivery_event
    k = Rails.application.config_for(:kafka)
    Karafka.producer.produce_async(
      topic: k.default_topic,
      payload: self.to_json
    )
  end

  def assign_before_validation
    if self.assigned_to_id == nil or self.assigned_to_id == 0
      user = User.where(
        :country_id => self.destination_id,
        :role_id => 2
      ).first
      self.assigned_to_id = user.id
    end
  end
end
