class Client < ApplicationRecord
    has_many :orders, dependent: :destroy
    belongs_to :type
end
