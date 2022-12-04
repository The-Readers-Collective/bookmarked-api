class CreateFollowings < ActiveRecord::Migration[5.2]
  def change
    create_table :followings do |t|
      t.references :user, foreign_key: true
      t.integer :followed_id

      t.timestamps
    end
  end
end
