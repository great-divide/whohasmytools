class ContractsController < ApplicationController

	post "/contracts/new" do
		binding.pry
		if logged_in?
			@user = current_user
			@contract = Contract.create

		else
			redirect '/users/login'
		end
	end

end