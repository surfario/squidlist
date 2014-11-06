class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :user_surf_breaks
  has_many :surf_breaks, through: :user_surf_breaks

  has_many :user_concerts
  has_many :concerts, through: :user_concerts

  has_one :user_interest
end
