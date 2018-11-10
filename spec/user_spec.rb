require_relative "spec_helper"
require 'pry'

describe 'User' do
	before :each do
		%w(ben peter).each do |x|
			eval "@#{x} = User.new; @#{x}.username = '#{x}'; @#{x}.password = '123'; @#{x}.save"
		end
		@contract = Contract.create
		@drill = Tool.create(name: "drill", description: "cordless dewalt")
		# binding.pry
	end

	it "can be added to Contract as loaner" do
		@contract.loaner = @peter
		expect(@contract.loaner).to eq(@peter)
	end

	it "can be added to Contract as borrower" do
		@contract.borrower = @ben
		expect(@contract.borrower).to eq(@ben)
	end

	it "a User's loaners array is updated when User has been added to a Contract as a Borrower" do
		@contract.borrower = @ben
		@contract.loaner = @peter
		binding.pry
		@contract.save
		expect(@ben.loaners).to include(@peter)
	end

	it "a User's borrowers array is updated when User has been added to a Contract as a Loaner" do
		@contract.borrower = @ben
		@contract.loaner = @peter
		@contract.save
		expect(@peter.borrowers).to include(@ben)
	end

end