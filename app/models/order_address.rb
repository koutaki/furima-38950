class OrderAddress
  include ActiveModel::Model
  attr_accessor :token,:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number,:user_id,:item_id
  with_options presence: true do
    validates :postal_code,       format: {with: /\A[0-9]{3}-[0-9]{4}\z/,        message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id,     numericality: { other_than: 1 ,                message: "can't be blank"}
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d+\z/, message: "は半角数字のみで入力してください" }
    validates :user_id
    validates :item_id
    validates :token
  end
    
  validates :phone_number, length: { in: 10..11, message: "は10桁以上11桁以下で入力してください" }

  def save
    # 購入情報を保存し、変数orderに代入する
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end

end