class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  # has_attached_file :avatar, default_url: "avatar.png"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/avatar_default.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  acts_as_voter
  validates_associated :posts
  has_many :comments, dependent: :destroy
  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following

  def follow(user_id)
    following_relationships.create(following_id: user_id)
  end

  def unfollow(user_id)
    following_relationships.find_by(following_id: user_id).destroy
  end
end
