class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :book, foreign_key: true

      t.timestamps
    end
  end
end
