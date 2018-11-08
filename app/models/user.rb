class USER < ActiveRecord::Base
	has_secure_password
	has_many :tools
end
