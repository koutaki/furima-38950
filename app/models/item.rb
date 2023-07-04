class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :shipping_cost 
  belongs_to :shipping_day
  belongs_to :item_condition
  has_one_attached :image
  belongs_to :user
  has_one :order, dependent: :destroy

  validates :name,              presence: true
  validates :introduction,      presence: true
  validates :price,             presence: true, numericality: { only_integer: true, message: 'は半角数値で入力してください' }
  validates :price,             numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'は¥300〜¥9,999,999の間で半角数値入力してください' }  
  validates :category_id,       numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,     numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_cost_id,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day_id,   numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :image         ,    presence: true

  def sold_out?
    order.present?
  end 

end
