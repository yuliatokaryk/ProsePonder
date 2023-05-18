class Author < ApplicationRecord
  has_many :books

  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
end
