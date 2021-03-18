require 'rails_helper'

RSpec.feature 'Following', type: :feature do
  before :each do
    @user1 = User.create!(fullname: "german aquila", username: "german_aquila", email: 'german@gmail.com', password: 'german1', avatar_photo: '200x200.jpeg', cover_photo: '600x200.jpeg')
    @userw = User.create!(fullname: "germano aquila", username: "axel_aquila", email: 'axel@gmail.com', password: 'german1', avatar_photo: '200x200.jpeg', cover_photo: '600x200.jpeg')
    Recipe.create(user_id: @user1.id, description: 'my first post')
  end
end