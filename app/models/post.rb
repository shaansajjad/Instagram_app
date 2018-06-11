class Post < ApplicationRecord
  acts_as_votable

  validates :user_id, presence: true

  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy



  scope :of_followed_users, -> (following_users) { where user_id: following_users }

  has_attached_file :image, styles: { medium: "500x00>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
