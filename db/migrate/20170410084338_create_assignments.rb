class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.references :roster, null: false
      t.references :person, null: false

      t.date :from_date, null: false
      t.date :to_date # if null, the assignment is permanent

      t.timestamps
    end
  end
end
