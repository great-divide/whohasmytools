class ContractsController < ApplicationController

	post "/contracts/new" do
	
		if logged_in? && User.find_by(username: params["loan"]["borrower"])
		
			if params["loan"]["tool"] == ""
				flash[:tool_error] = "You forgot to select a tool."
				redirect "/users/#{current_user.id}"
			else
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
					flash[:tool_not_available] = "That tool is already loaned out!"
					redirect "/users/contracts"
				end
			end
		elsif !logged_in?
			flash[:login_error] = "Oops, you're not logged in! Please log in to continue."
			redirect '/'
		else 
			
			flash[:loan_error] = "Either you forgot to select a User or that User does not exist. Maybe you misspelled it?"
			redirect "/users/#{current_user.id}"
		end
	end

	get '/users/contracts' do
		
		if logged_in?
			@user = current_user
			
			erb :"/contracts/user_contracts"
		else 
			flash[:login_error] = "Oops, you're not logged in! Please log in to continue."
			redirect '/'
		end
	end

	post '/contracts/:id/' do
		@contract = Contract.find_by(id: params["id"])
		if logged_in?
			
			erb :'/contracts/show_contract'
		else 
			flash[:login_error] = "Oops, you're not logged in! Please log in to continue."
			redirect '/'
		end
	end

	patch '/contracts/:id/' do
		
		@contract = Contract.find_by(id: params["id"])

		if logged_in? && params["terminate"]
			
			@contract.terminate
			
			redirect "/users/contracts"
		else
			redirect "/"
		end 

	end

end