class Book < ApplicationRecord
  # validation
  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 200}

  # association
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # 引数で渡されたユーザが favorites テーブル内に調べるメソッド
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
