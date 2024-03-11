class User < ApplicationRecord
  has_one :company, dependent: :destroy
  has_one :candidate, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %i[role_candidate role_company]

  validates :role, presence: true

  # after_create :define_a_new_method

  # private

  # def define_a_new_method

  # end
end
