class CreateDistances < ActiveRecord::Migration[5.2]
  def change
    create_table :distances do |t|
      t.float :miles_away
      t.string :start_zipcode
      t.string :target_zipcode
      t.references :self, foreign_key: { to_table: :users }, null: false #self as in this is my zipcode
      t.references :target, foreign_key: { to_table: :users }, null: false #as in the *other* users zipcode to compare
      t.timestamps
    end
  end
end
