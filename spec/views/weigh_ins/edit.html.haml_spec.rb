require 'spec_helper'

describe "weigh_ins/edit" do
  before(:each) do
    @weigh_in = assign(:weigh_in, stub_model(WeighIn,
      :person_id => 1,
      :weight => "9.99"
    ))
  end

  it "renders the edit weigh_in form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => weigh_ins_path(@weigh_in), :method => "post" do
      assert_select "input#weigh_in_person_id", :name => "weigh_in[person_id]"
      assert_select "input#weigh_in_weight", :name => "weigh_in[weight]"
    end
  end
end
