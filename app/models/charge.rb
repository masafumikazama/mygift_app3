class Charge < ApplicationRecord
  belongs_to :customer
  belongs_to :gift
  has_many :messages, dependent: :destroy
end
