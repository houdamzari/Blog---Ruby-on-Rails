class Users < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo # should be a link to an image
      t.text :bio
      t.integer :posts_counter, default: 0
      t.timestamps
    end
  end
end