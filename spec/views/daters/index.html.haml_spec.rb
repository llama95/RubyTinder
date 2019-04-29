require 'rails_helper'

RSpec.describe "daters/index", type: :view do
  before(:each) do
    assign(:daters, [
      Dater.create!(
        :name => "Name",
        :username => "Username",
        :password => "Password",
        :phone_number => "Phone Number",
        :gender => "Gender",
        :age => 2
      ),
      Dater.create!(
        :name => "Name",
        :username => "Username2",
        :password => "Password",
        :phone_number => "Phone Number",
        :gender => "Gender",
        :age => 2
      )
    ])
  end

  it "renders a list of daters" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Username".to_s, :count => 1
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
