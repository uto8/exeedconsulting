class Order < ApplicationRecord
  belongs_to :buyer, class_name: 'User', optional: true
  belongs_to :seller, class_name: 'User', optional: true
  belongs_to :item
end
