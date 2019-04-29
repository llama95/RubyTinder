require 'rails_helper'

RSpec.describe DatersController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Dater. As you add validations to Dater, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
        {:username => "abraham",
         :name => "abraham",
         :password => "abraham",
         :phone_number => "8084902511",
         :age => 22
        }
  }

  let(:invalid_attributes) {


            {:username => "abraham",
             :name => "abraham",
             :password => "abraham",
             :phone_number => "8084902511",
             :age => "a string for age"
            }

  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DatersController. Be sure to keep this updated too.
  let(:valid_session) { {} }


  describe "POST #create" do
    context "with valid params" do

      it "doesnt allow users under age 18" do
        post :create, :dater => {:age => 3, :interests =>"a"}
        expect(flash[:message] == true)
      end
      
      
    end

  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {:username => "abraham",
        :name => "abraham",
        :password => "abraham",
        :phone_number => "8084902511",
        :age => 22
        }
      }

      it "updates the requested dater" do
        dater = Dater.create! valid_attributes
        put :update, {:id => dater.to_param, :dater => new_attributes}, valid_session
        dater.reload
      end

      it "redirects to the dater" do
        dater = Dater.create! valid_attributes
        put :update, {:id => dater.to_param, :dater => valid_attributes}, valid_session
        expect(response).to redirect_to(dater)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        dater = Dater.create! valid_attributes
        put :update, {:id => dater.to_param, :dater => invalid_attributes}, valid_session
        expect(response).to redirect_to(dater_path 1)
      end
    end
  end
 

end
