class Post < ApplicationRecord
	has_many :likes

	validates :user_id, presence: true

	belongs_to :user

	has_many :comments, dependent: :destroy

	has_attached_file :image, styles: { medium: "500x00>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
