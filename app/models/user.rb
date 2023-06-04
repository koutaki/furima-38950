class User < ApplicationRecord
  validates :nickname,          presence: true
  validates :password,          presence: true
  validates :family_name,       presence:  { message: "全角（漢字・ひらがな・カタカナ）で入力してください" }
  validates :fairst_name,       presence:  { message: "全角（漢字・ひらがな・カタカナ）で入力してください" }
  validates :family_name_kana,  presence:  { message: "全角カタカナで入力してください"}
  validates :fairst_name_kana,  presence:  { message: "全角カタカナで入力してください"}
  validates :birthday,          presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
