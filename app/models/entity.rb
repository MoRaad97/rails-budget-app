class Entity < ApplicationRecord
  belongs_to :user
  has_many :group_entities, dependent: :destroy
  has_many :groups, through: :group_entities

  validates :name, :amount, :user_id, presence: true
end
