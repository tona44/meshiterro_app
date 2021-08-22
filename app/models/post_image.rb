class PostImage < ApplicationRecord

  belongs_to :user
  attachment :image
  has_many :post_comments,dependent: :destroy
  has_many :favorites,dependent: :destroy
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  #[dependent: :destroy] 1:Nの関係において、「1」のデータが削除された場合、関連する「N」のデータも削除される設定

end
