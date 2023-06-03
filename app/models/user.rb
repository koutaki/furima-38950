class User < ApplicationRecord
  validates :nickname,          presence: true
  validates :family_name,       presence: true
  validates :fairst_name,       presence: true
  validates :family_name_kana,  presence: true
  validates :fairst_name_kana,  presence: true
  validates :birthday,          presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
