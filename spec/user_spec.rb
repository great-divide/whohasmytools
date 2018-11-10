require_relative "spec_helper"
require 'pry'

describe "User" do

  describe 'User basics' do
	it "cannot be saved without password" do
		@user = User.new
		@user.username = "Bob"
		expect(@user.save).to eq(false)
	end

	it "has many tools" do
		@user = User.create(username: "John", password: "abc123")
		@drill = Tool.create
		@hammer = Tool.create
		@hammer.user_id = @user.id
		@hammer.save

		expect(@user.tools).to include(@hammer)
	end
  end

  describe 'User/Contract associations' do

	before :each do
		%w(peter ben brian).each do |x|
			eval "@#{x} = User.new; @#{x}.username = '#{x}'; @#{x}.password = '123'; @#{x}.save"
		end

		@contract = Contract.create
		@drill = Tool.create(name: "drill", description: "cordless dewalt")
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
		@contract.borrower = @brian
		@contract.loaner = @peter
		@contract.save
		binding.pry
		expect(@brian.loaners).to include(@peter)
	end

	it "a User's borrowers array is updated when User has been added to a Contract as a Loaner" do
		@contract.borrower = @ben
		@contract.loaner = @peter
		@contract.save
		expect(@peter.borrowers).to include(@ben)
	end
end

end