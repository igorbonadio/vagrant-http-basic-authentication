require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "VagrantHttpBasicAuthentication" do
  it "adds the with_basic_authentication method to a string" do
    "https://server.com".should respond_to(:with_basic_authentication)
  end

  it "overrides the to_s method of a HTTP URL string" do
    $stdout.stub(:puts)
    $stdout.stub(:print)
    $stdin.should_receive(:gets).twice.and_return("something")
    "https://server.com".with_basic_authentication.to_s.should be == "https://something:something@server.com"
  end
end
