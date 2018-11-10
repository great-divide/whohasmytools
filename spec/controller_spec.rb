require_relative "spec_helper"

def app
  ApplicationController
end

describe ApplicationController do
  it "allows User to Sign Up" do
    get '/'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include("Sign Up")
  end
end
