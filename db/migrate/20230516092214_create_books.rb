class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false, default: "unknown"
      t.text :description
      t.datetime :finish, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
