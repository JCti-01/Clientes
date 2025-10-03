class Client < ApplicationRecord
  belongs_to :user
  has_many :client_addresses, dependent: :destroy
end
