class CreateRosters < ActiveRecord::Migration[5.1]
  def change
    create_table :rosters do |t|
      t.string :name, null: false

      t.integer :period, null: false # initially either :weekly or :monthly
      t.integer :interval, null: false, default: 1 # the number of periods a person is rostered for

      t.integer :num_people_required, null: false, default: 1

      t.timestamps
    end
  end
end
