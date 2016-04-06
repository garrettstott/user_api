class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :age
      t.float :weight
      t.date :dob
      t.string :race
      t.string :hair_color
      t.string :eye_color
      t.boolean :alive, default: true

      t.timestamps null: false
    end
  end
end
