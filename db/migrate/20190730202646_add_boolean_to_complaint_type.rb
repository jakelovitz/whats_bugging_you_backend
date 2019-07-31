class AddBooleanToComplaintType < ActiveRecord::Migration[5.2]
  def change
    add_column :complaint_types, :disabled, :boolean
  end
end
