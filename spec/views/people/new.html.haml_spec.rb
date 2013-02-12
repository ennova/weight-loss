require 'spec_helper'

describe "people/new" do
  before(:each) do
    assign(:person, stub_model(Person,
      :name => "MyString",
      :height => "9.99",
      :target_bmi => "9.99"
    ).as_new_record)
  end

  it "renders new person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => people_path, :method => "post" do
      assert_select "input#person_name", :name => "person[name]"
      assert_select "input#person_height", :name => "person[height]"
      assert_select "input#person_target_bmi", :name => "person[target_bmi]"
    end
  end
end
