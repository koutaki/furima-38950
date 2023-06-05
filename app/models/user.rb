class User < ApplicationRecord
  validates :nickname,          presence: true
  validates :password,          presence: true
  validates :family_name,       presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）文字を使用してください' }
  validates :fairst_name,       presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）文字を使用してください' }
  validates :family_name_kana,  presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: '全角カタカナを使用してください' }
  validates :fairst_name_kana,  presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: '全角カタカナを使用してください' }
  validates :birthday,          presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
