class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.references :list, null: false, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
