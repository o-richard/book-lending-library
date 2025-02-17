class Book < ApplicationRecord
  has_many :borrowings, dependent: :destroy
  validates :title, :author, presence: true
end
