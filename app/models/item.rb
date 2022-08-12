class Item < ApplicationRecord
  belongs_to :user
  enum item_status:{new: 0,unused:1,old:2}, _prefix: true
  enum delivery_fee:{ seller: 0, buyer: 1 }
  enum delivery_day:{ soon: 0, normal: 1, late: 2 }
end
