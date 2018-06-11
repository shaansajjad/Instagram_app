class Search < ApplicationRecord
	def users
		@users ||= find_users
	end

private

def find_users
users = User.order(:Username) 

end

end
