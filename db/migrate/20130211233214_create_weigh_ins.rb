class CreateWeighIns < ActiveRecord::Migration
  def change
    create_table :weigh_ins do |t|
      t.integer :person_id
      t.decimal :weight
      t.datetime :date

      t.timestamps
    end
  end
end
