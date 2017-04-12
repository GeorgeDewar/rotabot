class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.references :roster, null: false
      t.references :person, null: false

      t.integer :year, null: false
      t.integer :week_number
      t.integer :month_number

      t.timestamps
    end
  end
end
