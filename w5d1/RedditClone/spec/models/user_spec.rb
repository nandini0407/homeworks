require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should have_many(:subs) }
  it { should have_many(:comments) }

  describe '#is_password?' do
    jack = User.create(email: 'jack', password: 'hello123')

    it 'verifies if password is correct' do
      expect(jack.is_password?('hello123')).to be true
    end

    it 'verifies if password is incorrect' do
      expect(jack.is_password?('fetwyxs')).to be false
    end
  end

  describe '#reset_session_token' do
    jack = User.create(email: 'jack', password: 'hello123')
    session_token_before = jack.session_token
    jack.reset_session_token
    session_token_after = jack.session_token

    it 'should change the user\'s session token' do
      expect(session_token_after).to_not eq(session_token_before)
    end

    it 'returns new session token' do
      expect(jack.reset_session_token).to eq(jack.session_token)
    end
  end

  describe '::find_by_credentials' do
    john = User.new(email: 'john', password: 'hello123')
    john.save!

    it 'returns nil if email is not found' do
      expect(User.find_by_credentials('jill', 'bfdmcbdsubfu')).to eq(nil)
    end

    it 'returns user if both email and password are correct' do
      expect(User.find_by_credentials('john', 'hello123')).to eq(john)
    end
  end

end
