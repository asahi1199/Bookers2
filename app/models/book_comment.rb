class BookComment < ApplicationRecord
   # association
  belongs_to :user
  belongs_to :book
end
