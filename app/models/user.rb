class User < ApplicationRecord
  has_many :listings, dependent: :destroy  # A user can have many listings, and if the user is deleted, their listings will be deleted as well.
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
