class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.text :password_digest
      t.text :password_confirmation
      t.integer :happiness
      t.integer :nausea
      t.integer :height
      t.integer :tickets

      t.timestamps
    end
  end
end
