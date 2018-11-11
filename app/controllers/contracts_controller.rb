class ContractsController < ApplicationController

	post "/contracts/new" do
		binding.pry
		if logged_in? && User.find_by(username: params["loan"]["borrower"])
			
			@contract = Contract.create
			@contract.loaner = current_user
			@contract.borrower = User.find_by(username: params["loan"]["borrower"])
			@contract.tool = Tool.find_by(name: params["loan"]["tool"])
			@contract.save
		else
			# clearer to either use flash message or go to dedicated login page 'sorry you must log in'... flash sounds snazzier
			redirect '/'
		end
	end

end