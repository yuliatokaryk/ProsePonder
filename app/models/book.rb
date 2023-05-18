class Book < ApplicationRecord
  belongs_to :author, optional: true

  validates :title, presence: true

  attr_accessor :new_author_name
end
