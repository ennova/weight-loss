class Person < ActiveRecord::Base
  attr_accessible :height, :name, :target_bmi

  has_many :weigh_ins

  def last_bmi
    bmi = 0
    weigh_in = weigh_ins.order('date').last

    if !weigh_in.nil?
      bmi = weigh_in.calculate_bmi
    end

    bmi
  end

  def last_weight
    weight = 0
    weigh_in = weigh_ins.order('date').last

    if !weigh_in.nil?
      weight = weigh_in.weight
    end

    weight
  end

  def starting_weight
    weight = 0
    weigh_in = weigh_ins.order('date').first

    if !weigh_in.nil?
      weight = weigh_in.weight
    end

    weight
  end

  def weight_difference
    last_weight - starting_weight
  end

  def last_week_weight
    weight = 0
    weigh_in = weigh_ins.order('date')[weigh_ins.count - 2]

    if !weigh_in.nil?
      weight = weigh_in.weight
    end

    weight
  end

  def week_difference
    last_weight - last_week_weight
  end
end
