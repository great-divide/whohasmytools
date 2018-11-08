class User < ActiveRecord::Base
	has_secure_password
	has_many :tools

	has_many :borrowers, class_name: "User", foreign_key: "borrower_id"

	has_many :lenders, class_name: "User", foreign_key: "lender_id"
end
