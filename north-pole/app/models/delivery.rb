class Delivery < ApplicationRecord
    belongs_to :customer, class_name: "User"
    belongs_to :assigned_to, class_name: "User"
end
