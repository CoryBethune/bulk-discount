class Discount < ApplicationRecord
  belongs_to :merchant

  validates_presence_of :quantity
  validates_presence_of :percent_discount
end
