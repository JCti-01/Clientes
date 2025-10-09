class Client < ApplicationRecord
  belongs_to :user
  has_many :client_addresses, dependent: :destroy
  has_one_attached :client_image
  
  validates :name, :birthdate, :phone, presence: true

end
