class ContractsController < ApplicationController

	post "/contracts/new" do
		
		if logged_in? && User.find_by(username: params["loan"]["borrower"])
			@tool = Tool.find_by(name: params["loan"]["tool"])

			if @tool.contracts.select { |c| c.active == true }.empty?

				@contract = Contract.create
				@contract.loaner = current_user
				@contract.borrower = User.find_by(username: params["loan"]["borrower"])
				@contract.tool = @tool
				@tool.contracts << @contract
				@contract.save

				redirect "/users/contracts"
			else
				# flash message "That tool is already loaned out!"

				redirect "/users/contracts"
			end
		else
			# clearer to either use flash message or go to dedicated login page 'sorry you must log in'... flash sounds snazzier
			redirect '/'
		end
	end

	get '/users/contracts' do
		binding.pry
		if logged_in?
			@user = current_user
		
			erb :"/contracts/user_contracts"
		else 
			flash[:login_error] = "Oops, you're not logged in! Please log in to continue."
			redirect '/'
		end
	end

	post '/contracts/:id/terminate' do
		
		@contract = Contract.find_by(id: params["id"])

		if logged_in? && params["terminate"]
			binding.pry
			@contract.terminate
			
			redirect "/users/contracts"
		else
			redirect "/"
		end 

	end

end