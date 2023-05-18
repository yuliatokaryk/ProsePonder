class CreateUserBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :user_books do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :book, foreign_key: true
      t.string :state, default: "reading"

      t.timestamps
    end
  end
end
