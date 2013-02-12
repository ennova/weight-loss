require 'spec_helper'

describe "weigh_ins/index" do
  before(:each) do
    assign(:weigh_ins, [
      stub_model(WeighIn,
        :person_id => 1,
        :weight => "9.99"
      ),
      stub_model(WeighIn,
        :person_id => 1,
        :weight => "9.99"
      )
    ])
  end

  it "renders a list of weigh_ins" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
