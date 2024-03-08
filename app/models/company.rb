class Company < ApplicationRecord
  belongs_to :user
  has_many :jobs, dependent: :destroy

  validates :name, :headquarters, :industry, :description, :contact_info, presence: true
end
