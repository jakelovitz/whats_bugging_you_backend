class CreateReactions < ActiveRecord::Migration[5.2]
  def change
    create_table :reactions do |t|
      t.integer :complaint_id
      t.integer :user_id
      t.integer :updated_severity
      t.text :cooldown_thoughts
      t.timestamps
    end
  end
end
