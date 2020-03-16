class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :complexity, null: false
      t.integer :priority, nul: false

      t.timestamps
    end
  end
end
