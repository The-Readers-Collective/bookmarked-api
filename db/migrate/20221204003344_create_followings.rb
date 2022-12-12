class CreateFollowings < ActiveRecord::Migration[5.2]
  def change
    create_table :followings do |t|
      t.references :user, foreign_key: true
      t.references :followed_id, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
  end
end
