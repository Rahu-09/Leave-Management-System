class CreateLeaveApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :leave_applications do |t|
      t.string :start_date
      t.string :end_date
      t.string :leave_type
      t.text :leave_reason
      t.string :status
      t.text :description

      t.timestamps
    end
  end
end
