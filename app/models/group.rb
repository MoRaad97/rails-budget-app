class Group < ApplicationRecord
  belongs_to :user
  has_many :entities
  
  validates :name, :icon, :user_id, presence: true
end
