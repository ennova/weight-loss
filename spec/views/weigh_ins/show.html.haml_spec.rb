require 'spec_helper'

describe "weigh_ins/show" do
  before(:each) do
    @weigh_in = assign(:weigh_in, stub_model(WeighIn,
      :person_id => 1,
      :weight => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/9.99/)
  end
end
