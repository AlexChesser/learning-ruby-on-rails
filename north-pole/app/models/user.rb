class User < ApplicationRecord
    has_one :Locale
    has_one :Country
    has_one :Role
end
