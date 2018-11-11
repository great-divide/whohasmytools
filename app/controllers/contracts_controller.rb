class ContractsController < ApplicationController

	post "/contracts/new" do
		
		if logged_in? && User.find_by(username: params["loan"]["borrower"])
			@tool = Tool.find_by(name: params["loan"]["tool"])

			if @tool.contracts.select { |c| c.active == true }.empty?

				@contract = Contract.create
				@contract.loaner = current_user
				@contract.borrower = User.find_by(username: params["loan"]["borrower"])
				@contract.tool = @tool
				@contract.save

				redirect "/contracts/#{@contract.id}"
			else
				# flash message "That tool is already loaned out!"

				redirect "/users/#{current_user.id}"
			end
		else
			# clearer to either use flash message or go to dedicated login page 'sorry you must log in'... flash sounds snazzier
			redirect '/'
		end
	end

	get '/contracts/:id' do
		@user = current_user
		@contract = Contract.find_by(params["id"])

		erb :"/contracts/show"
	end

end