require 'rails_helper'

RSpec.describe Discount, type: :model do
  describe 'associations' do
    it { should belong_to :merchant}
  end

  describe 'validations' do
    it {should validate_presence_of :quantity}
    it {should validate_presence_of :percent_discount}
  end
end
