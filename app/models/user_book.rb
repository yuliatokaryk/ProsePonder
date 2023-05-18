class UserBook < ApplicationRecord
  belongs_to :user
  belongs_to :book

  attribute :state, :string, default: 'reading'

  state_machine :state, initial: :reading do
    event :finish do
      transition reading: :finished
    end
  end
end
