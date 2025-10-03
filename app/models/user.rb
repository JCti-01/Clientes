class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :user_profile, dependent: :destroy
  accepts_nested_attributes_for :user_profile
  has_many :clients

  after_create :create_user_profile

  private

  
  def create_user_profile
    build_user_profile(
      email: email,
      phone: "xxxxxxxx",
      gender: "..."
    ).save
  end

end
