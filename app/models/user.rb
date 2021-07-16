class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :friendships
  has_many :inverse_friendships, -> { where confirmed: nil }, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :received_requests, through: :inverse_friendships

  has_many :accepted_friendships, -> { where confirmed: true }, class_name: 'Friendship'
  has_many :friends, through: :accepted_friendships

  has_many :sent_friendship_requests, -> { where confirmed: nil }, class_name: 'Friendship', foreign_key: 'user_id'
  has_many :pending_friends, through: :sent_friendship_requests, source: :friend

  def friend?(user)
    friends.include?(user)
  end
end
