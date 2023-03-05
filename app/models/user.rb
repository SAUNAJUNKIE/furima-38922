class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :first_name, presence: true
  validates :second_name, presence: true
  validates :first_name_kana, presence: true
  validates :second_name_kana, presence: true
  validates :birthday, presence: true

  has_many  :items
  has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

