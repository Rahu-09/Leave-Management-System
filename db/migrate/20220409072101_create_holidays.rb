class CreateHolidays < ActiveRecord::Migration[7.0]
  def change
    create_table :holidays do |t|
      t.string :start_date
      t.string :end_date
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
