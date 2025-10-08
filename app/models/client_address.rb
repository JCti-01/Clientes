class ClientAddress < ApplicationRecord
  belongs_to :client
  validates :address, :city, :state, :country, presence: true
end
