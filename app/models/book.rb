class Book < ApplicationRecord
  # validation
  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 200}

  # association
  belongs_to :user
  has_many :book_comments, dependent: :destroy
end
