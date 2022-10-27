class Entity < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :name, :amount, :user_id, presence: true
end
