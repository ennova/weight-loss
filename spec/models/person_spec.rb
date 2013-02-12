require 'spec_helper'

describe Person do
  let(:person) { FactoryGirl.create(:person) }

  describe "should be able to" do
    
    it "calculate last weight" do
      person.last_weight.to_f.should eq 86.23
    end

    it "calculate last BMI" do
      person.last_bmi.to_f.should eq 26.032483999516966 # (86.23 / (1.82 * 1.82))
    end
  end
end
