class Company < ApplicationRecord
  belongs_to :user
  has_many :jobs, dependent: :destroy
  has_one_attached :logo

  validates :name, :headquarters, :industry, :description, :contact_info, :logo, presence: true
end
