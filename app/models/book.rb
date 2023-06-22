class Book < ApplicationRecord
  belongs_to :author, optional: true

  has_many :notes
  has_many :user_books
  has_many :users, through: :user_books

  validates :title, presence: true

  accepts_nested_attributes_for :author, reject_if: proc { |attributes| attributes['name'].blank? }
end
