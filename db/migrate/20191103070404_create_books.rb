class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.references :author, foreign_key: true, null:false
      t.integer :status, null: false
      t.text :why_want_read
      t.text :review
      t.integer :raiting
      t.date :date_insert, null: false
      t.date :date_start_reading
      t.date :date_finish_reading

      t.timestamps
    end
  end
end
