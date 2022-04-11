class CreateLeaveApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :leave_applications do |t|
      t.string :start_date
      t.string :end_date
      t.integer :leave_type_id, null: false
      t.integer :user_id, null: false
      t.text :leave_reason
      t.string :status
      t.text :description

      t.timestamps
    end
  end
end
