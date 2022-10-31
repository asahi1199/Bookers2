class BookComment < ApplicationRecord
   # association
  belongs_to :user
  belongs_to :book

  # validation
  validates :comment, presence: true
end
