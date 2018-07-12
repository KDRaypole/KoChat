class User < ApplicationRecord
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_uniqueness_of :email

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/assets/smiley.jpeg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users

  has_many :active_friendships, class_name: "Friendship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_friendships, class_name: "Friendship", foreign_key: "followed_id", dependent: :destroy

  has_many :following, through: :active_friendships, source: :followed
  has_many :followers, through: :passive_friendships, source: :follower

  def to_param
    "#{username}".parameterize
  end

  def follow(user)
    active_friendships.create(followed_id: user.id)
  end

  def unfollow(user)
    active_friendships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    following.include?(user)
  end
end
