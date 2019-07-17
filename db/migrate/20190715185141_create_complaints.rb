class CreateComplaints < ActiveRecord::Migration[5.2]
  def change
    create_table :complaints do |t|
      t.integer :complaint_type_id
      t.integer :severity
      t.text :complaint_text
      t.timestamps
    end
  end
end
