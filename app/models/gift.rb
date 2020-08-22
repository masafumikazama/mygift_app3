class Gift < ApplicationRecord
  belongs_to :registry
  has_many :charges, dependent: :destroy
end
