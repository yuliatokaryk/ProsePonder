class Book < ApplicationRecord
  belongs_to :author, optional: true
  has_many :notes
  has_many :user_books
  has_many :users, through: :user_books

  validates :title, presence: true

  attr_accessor :new_author_name
end
