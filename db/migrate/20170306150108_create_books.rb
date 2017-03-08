class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :book_name
      t.string :author
      t.string :price
      t.string :description
      t.string :book_type
      t.boolean :available, default: true

      t.timestamps null: false
    end
  end
end
