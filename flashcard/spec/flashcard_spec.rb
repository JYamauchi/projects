require 'spec_helper'
require 'pry'
require_relative '../lib/flashcard_menu'

describe Bank do
  it "can be instantiated" do
    bank = Bank.new("J.P. Chase Morgan")
    expect(bank.class).to be(Bank)
  end



describe '.create' do
    it 'persists a user with valid attributes' do
      user = User.create(:name => 'Jane')

      expect(user).to be_persisted
    end

    it 'does not persist if attributes are not valid' do
      user = User.create

      expect(user).not_to be_persisted
      expect(user.errors[:name]).to include("can't be blank")
    end
  end
end