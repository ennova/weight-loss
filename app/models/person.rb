class Person < ActiveRecord::Base
  attr_accessible :height, :name, :target_bmi

  has_many :weigh_ins

  def last_bmi
    bmi = 0
    weigh_in = WeighIn.last

    if !weigh_in.nil?
      bmi = weigh_in.calculate_bmi
    end

    bmi
  end

  def last_weight
    weight = 0
    weigh_in = WeighIn.last

    if !weigh_in.nil?
      weight = weigh_in.weight
    end

    weight
  end
end
