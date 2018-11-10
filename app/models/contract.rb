class Contract < ActiveRecord::Base
	# modeled on https://medium.com/@jbmilgrom/active-record-many-to-many-self-join-table-e0992c27c1e
	belongs_to :tool
	belongs_to :loaner, foreign_key: "loaner_id", class_name: "User"
	belongs_to :borrower, foreign_key: "borrower_id", class_name: "User"

	after_initialize :init
	

	# WHY THIS NOT WORKING?????
	# def init
	# 	self.active = true
	# 	get loaner/borrower names from ids
	# end

	# def terminate
	# 	self.active = false
	# end
end