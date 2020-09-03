class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :status, :shipping_fee, :prefectere, :scheduled

  #空の投稿を保存できないようにする
  validates :item_image, :item_name, :item_info, :category, :status, :shippingfee, :prefecture, :scheduled_id, :item_price,   presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :status_id, :shippingfee_id, :prefecture_id, :scheduled_id,  numericality: { other_than: 1 }

end
