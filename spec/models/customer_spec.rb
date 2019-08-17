require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'Relationships' do
    it {should have_many :invoices}
    it {should have_many(:merchants).through(:invoices)}
  end
end
