class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 8, maximum: 128 },
  format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は英字と数字をそれぞれ1文字以上含めて設定してください' },
  exclusion: { in: %w[password PASSWORD 12345678 87654321], message: 'は使用できません' }
validates :first_name, presence: true, format: { with: /\A[一-龥ぁ-ん]+\z/, message: "は漢字・ひらがなで入力してください" }
validates :second_name, presence: true, format: { with: /\A[一-龥ぁ-ん]+\z/, message: "は漢字・ひらがなで入力してください" }
validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "はカタカナで入力してください" }
validates :second_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "はカタカナで入力してください" }
validates :birthday, presence: true


  
  #has_many  :items
  #has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

