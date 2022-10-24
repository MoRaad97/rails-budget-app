class Entity < ApplicationRecord
  belongs_to :user
  has_many :groups

  validates :name, :amount, :user_id, presence: true
end
