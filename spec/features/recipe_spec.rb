require 'rails_helper'

RSpec.feature 'Recipes', type: :feature do
  before :each do
    @user1 = User.create!(fullname: "german aquila", username: "german_aquila", email: 'german@gmail.com', password: 'german1', avatar_photo: '200x200.jpeg', cover_photo: '600x200.jpeg')
    @userw = User.create!(fullname: "germano aquila", username: "axel_aquila", email: 'axel@gmail.com', password: 'german1', avatar_photo: '200x200.jpeg', cover_photo: '600x200.jpeg')
    Recipe.create(user_id: @user1.id, description: 'my first post')
  end


  # it 'Should create a Recipe post' do
  #   visit new_user_session_path
  #   fill_in 'user_email', with: 'german@email.com'
  #   fill_in 'user_password', with: '123456'
  #   # fill_in 'user_password_confirmation', with: '123456'
  #   click_on 'Sign up'
  #   visit root_path
  #   fill_in 'Add new Recipe', with: 'This is a Recipe'
  #   click_button 'Post New Recipe'
  #   expect(page).to have_content('This is a Recipe')
  #  end
  
  #  it 'Should NOT BE ABLE TO create a recipe' do
  #   visit root_path
  #   expect(page).to_not have_content('Recipe.new[description]')
  # end
end