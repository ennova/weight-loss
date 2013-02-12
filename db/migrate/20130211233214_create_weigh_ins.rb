class CreateWeighIns < ActiveRecord::Migration
  def change
    create_table :weigh_ins do |t|
      t.integer :person_id
      t.decimal :weight
      t.date :date

      t.timestamps
    end
  end
end
