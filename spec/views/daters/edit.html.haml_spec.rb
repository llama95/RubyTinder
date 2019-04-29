require 'rails_helper'

RSpec.describe "daters/edit", type: :view do
  before(:each) do
    @dater = assign(:dater, Dater.create!(
      :name => "MyString",
      :username => "MyString",
      :password => "MyString",
      :phone_number => "MyString",
      :gender => "MyString",
      :age => 1
    ))
  end

end
