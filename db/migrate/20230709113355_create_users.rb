class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.integer :height
      t.integer :weight
      t.string :gender

      t.timestamps
    end
  end
end
