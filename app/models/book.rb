class Book < ApplicationRecord
  belongs_to :author, optional: true
  has_many :notes

  validates :title, presence: true

  attr_accessor :new_author_name
end
