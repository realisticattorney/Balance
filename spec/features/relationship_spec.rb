require 'rails_helper'

RSpec.feature 'Following', type: :feature do
  before :each do
    @user1 = User.create!(email: 'german1@gmail.com', password: 'german1')
    @user2 = User.create!(email: 'axel1@gmail.com', password: 'german1')
  end
end