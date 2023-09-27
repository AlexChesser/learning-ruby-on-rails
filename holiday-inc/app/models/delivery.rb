class Delivery < ApplicationRecord
  belongs_to :customer, class_name: "User"
  belongs_to :assigned_to, class_name: "User"
  belongs_to :destination, class_name: "Country"
  has_one :invoice
  before_validation :assign_before_save

  def assign_before_save
    if self.assigned_to_id == nil or self.assigned_to_id == 0
      user = User.where(
        :country_id => self.destination_id,
        :role_id => 2
      ).first
      self.assigned_to_id = user.id
    end
  end
end
