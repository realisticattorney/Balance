require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'assoiations present' do
    it { should belong_to(:user) }
  end
  describe 'description presence' do
    it 'if contnet present' do
      e = Recipe.new
      e.description = 'pass'
      e.valid?
      expect(e.errors[:description]).not_to include("can't be blank")
    end
    it 'if description not present' do
      e = Recipe.new
      e.description = ''
      e.valid?
      expect(e.errors[:description]).to include("can't be blank")
    end
  end
end