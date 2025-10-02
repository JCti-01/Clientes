class Client < ApplicationRecord
  belongs_to :user
  has_many :client_address, dependent: :destroy
end
