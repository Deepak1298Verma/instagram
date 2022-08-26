class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  has_one_attached :avatar

  #we are following others
  has_many :followed_users, foreign_key: :follower_id, class_name: "follow"
  has_many :followees, through: :followed_users, class_name: "follow"

  #users following us
  has_many :following_users, foreign_key: :followee_id
  has_many :followers, through: :following_users
  
end
