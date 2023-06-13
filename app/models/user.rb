class User < ApplicationRecord
  validates :nickname,          presence: true
  validates :password,          presence: true, length: { minimum: 6 }
  validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/, message: 'は半角英数字混合で入力してください' }
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ヶー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）文字を使用してください' }
  validates :fairst_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ヶー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）文字を使用してください' }
  validates :family_name_kana,  presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'は全角カタカナを使用してください' }
  validates :fairst_name_kana,  presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'は全角カタカナを使用してください' }
  validates :birthday,          presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :itemes
  private

  def password_complexity
    return if password.blank? || password =~ /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/
       
    errors.add(:password, 'は半角英数字混合で入力してください')
  end
end
