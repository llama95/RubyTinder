require 'rails_helper'

RSpec.describe "daters/new", type: :view do
  before(:each) do
    assign(:dater, Dater.new(
      :name => "MyString",
      :username => "MyString",
      :password => "MyString",
      :phone_number => "MyString",
      :gender => "MyString",
      :age => 1
    ))
  end

end
