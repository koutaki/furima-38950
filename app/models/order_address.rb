class OrderAddress
  include ActiveModel::Model
  attr_accessor :token,:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number,:user_id,:item_id
  with_options presence: true do
    validates :postal_code,       format: {with: /\A[0-9]{3}-[0-9]{4}\z/,        message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id,     numericality: { other_than: 1 ,                message: "can't be blank"}
    validates :city,              format: { with: /\A[ぁ-んァ-ン一-龥々ヶー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）文字を使用してください' }
    validates :house_number,      format: { with: /\A[a-z0-9]+\z/i,              message: 'は半角英数字を使用してください'  }  
    validates :building_name,     format: { with: /\A[ぁ-んァ-ン一-龥々ヶー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）文字を使用してください' }, allow_blank: true    
    validates :phone_number,      numericality: { only_integer: true,            message: 'は半角数値で入力してください' }
    validates :user_id
    validates :item_id
    validates :token, presence: true
  end

  def save
    # 購入情報を保存し、変数orderに代入する
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end

end