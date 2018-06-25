class Discovery < ApplicationRecord
  belongs_to :user
  has_attached_file :avatar, default_url: "avatar.png"
end
