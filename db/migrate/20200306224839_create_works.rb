class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.integer :author_id
      t.text :text

      t.timestamps
    end
    add_index :works, :author_id
    add_foreign_key :works, :users, column: :author_id
  end
end
