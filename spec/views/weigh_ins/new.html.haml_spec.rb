require 'spec_helper'

describe "weigh_ins/new" do
  before(:each) do
    assign(:weigh_in, stub_model(WeighIn,
      :person_id => 1,
      :weight => "9.99"
    ).as_new_record)
  end

  it "renders new weigh_in form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => weigh_ins_path, :method => "post" do
      assert_select "input#weigh_in_person_id", :name => "weigh_in[person_id]"
      assert_select "input#weigh_in_weight", :name => "weigh_in[weight]"
    end
  end
end
