class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.belongs_to :author, foreign_key: true, optional: true

      t.timestamps
    end
  end
end
