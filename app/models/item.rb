class Item < ApplicationRecord
  belongs_to :user
  belongs_to :university
  enum item_status:{new: 0,unused:1,old:2}, _prefix: true
  enum delivery_fee:{ buyer: 0, seller: 1 }
  enum delivery_day:{ soon: 0, normal: 1, late: 2 }

  has_many_attached :images

  validates :title, presence: true
  validates :price, presence: true
  has_many :favorites, dependent: :destroy

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end
end
