class Search < ApplicationRecord
  def users
    @users ||= find_users
    # // ||= is used for nil, false, or undefined
  end
  private
  def find_users
    users = User.order(:Username)
  end
end
