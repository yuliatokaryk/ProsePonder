class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :notes
  has_many :user_books
  has_many :books, through: :user_books

  def full_name
    "#{first_name} #{last_name}"
  end
end
