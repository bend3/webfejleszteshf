class Product < ApplicationRecord
  enum status: [:in_stock , :out_of_stock]
  has_many :purchases
  has_many :users, through: :purchases
end
