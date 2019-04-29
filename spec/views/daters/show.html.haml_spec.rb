require 'rails_helper'

RSpec.describe "daters/show", type: :view do
  before(:each) do
    @dater = assign(:dater, Dater.create!(
      :name => "Name",
      :username => "Username",
      :password => "Password",
      :phone_number => "Phone Number",
      :gender => "Gender",
      :age => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Gender/)
    expect(rendered).to match(/2/)
  end
end
