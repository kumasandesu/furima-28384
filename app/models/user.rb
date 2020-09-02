class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i    #パスワードは半角英数字混合
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/     #全角（漢字・ひらがな・カタカナ）で入力
  VALID_NAMEKANA_REGEX = /\A[ァ-ヶー－]+\z/    #全角（カタカナ）で入力

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, inclusion: { in: ('@')}
  validates :password, confirmation: true, presence: true,length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
  validates :repassword_confirmation, presence: true
  validates :name, presence: true,format: { with: VALID_NAME_REGEX }
  validates :namekana, presence: true, format: { with: VALID_NAMEKANA_REGEX }
  validates :birthday, presence: true

end
 