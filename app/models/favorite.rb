class Favorite < ApplicationRecord
  # association
  belongs_to :user
  belongs_to :book

  # validation (book_id と user_id の組み合わせの重複がないように)
  validates_uniqueness_of :book_id, scope: :user_id
end
