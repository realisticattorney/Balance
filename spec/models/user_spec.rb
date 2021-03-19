require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:fullname) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:avatar_photo) }
    it { should validate_presence_of(:cover_photo) }
    it { should validate_length_of(:username).is_at_least(3) }
    it { should validate_length_of(:fullname).is_at_least(3) }
  end

  describe 'associations' do
    it { should have_many(:likes) }
    it { should have_many(:followed_users) }
    it { should have_many(:followers) }
  end
end

context 'validation test' do
  it 'ensures username and fullname of user is present' do
    user = User.new(username: 'German').save
    expect(user).to eq(false)
  end

  it 'ensures minimum length for name to be 3' do
    user = User.new(username: 'Ger_Man', fullname: 'German Lol').save
    expect(user).to eq(false)
  end

  it 'ensures max length for name to be 3' do
    user = User.new(username: 'German German German German German', fullname: 'German Lol').save
    expect(user).to eq(false)
  end

  it 'should save successfully' do
    user = User.new(username: 'German', fullname: 'German Lol').save
    expect(user) == true
  end

  it 'validates Username uniqueness' do
    u = User.new(username: 'German', fullname: ' German Lol')
    u.save
    u2 = User.new(username: 'German', fullname: ' German Lol')
    expect(u2.valid?).to be_falsy
  end
end
