class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :product
  default_scope { where(purchased: false) }
end
