class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.decimal :height
      t.decimal :target_bmi

      t.timestamps
    end
  end
end
