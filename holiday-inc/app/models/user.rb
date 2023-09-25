class User < ApplicationRecord
    has_many :assigned, class_name: "Delivery", foreign_key: "assigned_to_id"
    has_many :shipped, class_name: "Delivery", foreign_key: "customer_id"
end
