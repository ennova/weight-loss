require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe WeighInsController do

  # This should return the minimal set of attributes required to create a valid
  # WeighIn. As you add validations to WeighIn, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "person_id" => "1", "weight" => 50, "date" => Date.today }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # WeighInsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET edit" do
    it "assigns the requested weigh_in as @weigh_in" do
      weigh_in = WeighIn.create! valid_attributes
      get :edit, {:id => weigh_in.to_param}, valid_session
      assigns(:weigh_in).should eq(weigh_in)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new WeighIn" do
        expect {
          post :create, {:weigh_in => valid_attributes}, valid_session
        }.to change(WeighIn, :count).by(1)
      end

      it "assigns a newly created weigh_in as @weigh_in" do
        post :create, {:weigh_in => valid_attributes}, valid_session
        assigns(:weigh_in).should be_a(WeighIn)
        assigns(:weigh_in).should be_persisted
      end

      it "redirects to the root url" do
        post :create, {:weigh_in => valid_attributes}, valid_session
        response.should redirect_to(root_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved weigh_in as @weigh_in" do
        # Trigger the behavior that occurs when invalid params are submitted
        WeighIn.any_instance.stub(:save).and_return(false)
        post :create, {:weigh_in => { "person_id" => "invalid value" }}, valid_session
        assigns(:weigh_in).should be_a_new(WeighIn)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested weigh_in" do
        weigh_in = WeighIn.create! valid_attributes
        # Assuming there are no other weigh_ins in the database, this
        # specifies that the WeighIn created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        WeighIn.any_instance.should_receive(:update_attributes).with({ "person_id" => "1" })
        put :update, {:id => weigh_in.to_param, :weigh_in => { "person_id" => "1" }}, valid_session
      end

      it "assigns the requested weigh_in as @weigh_in" do
        weigh_in = WeighIn.create! valid_attributes
        put :update, {:id => weigh_in.to_param, :weigh_in => valid_attributes}, valid_session
        assigns(:weigh_in).should eq(weigh_in)
      end

      it "redirects to person" do
        weigh_in = WeighIn.create! valid_attributes
        put :update, {:id => weigh_in.to_param, :weigh_in => valid_attributes}, valid_session
        response.should redirect_to(weigh_in.person)
      end
    end

    describe "with invalid params" do
      it "assigns the weigh_in as @weigh_in" do
        weigh_in = WeighIn.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        WeighIn.any_instance.stub(:save).and_return(false)
        put :update, {:id => weigh_in.to_param, :weigh_in => { "person_id" => "invalid value" }}, valid_session
        assigns(:weigh_in).should eq(weigh_in)
      end

      it "re-renders the 'edit' template" do
        weigh_in = WeighIn.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        WeighIn.any_instance.stub(:save).and_return(false)
        put :update, {:id => weigh_in.to_param, :weigh_in => { "person_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested weigh_in" do
      weigh_in = WeighIn.create! valid_attributes
      expect {
        delete :destroy, {:id => weigh_in.to_param}, valid_session
      }.to change(WeighIn, :count).by(-1)
    end

    it "redirects to the weigh_ins of the person who owned the weigh-in list" do
      weigh_in = WeighIn.create! valid_attributes
      delete :destroy, {:id => weigh_in.to_param}, valid_session
      response.should redirect_to(weigh_in.person)
    end
  end

end
