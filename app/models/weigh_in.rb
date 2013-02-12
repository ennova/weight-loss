class WeighIn < ActiveRecord::Base
  attr_accessible :date, :person_id, :weight

  belongs_to :person


  def calculate_bmi
    if !weight.nil? && !person.nil?
      weight / (person.height * person.height)
    end
  end
end
