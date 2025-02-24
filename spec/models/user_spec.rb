require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }

    context 'password validations' do
      it 'is invalid if password too short' do
        user = build(:user, password: 'As1', password_confirmation: 'As1')
        expect(user).to be_invalid
        expect(user.errors[:password]).to include("is too short, should contain min 8 characters")
      end

      it 'is invalid if password does not contain upper case' do
        user = build(:user, password: '12sd@s11212', password_confirmation: '12sd@s11212')
        expect(user).to be_invalid
      end

      it 'is invalid if password does not contain lower case' do
        user = build(:user, password: 'OASDN567@12', password_confirmation: 'OASDN567@12')
        expect(user).to be_invalid
      end

      it 'is invalid if password does not special character' do
        user = build(:user, password: 'Password231', password_confirmation: 'Password231')
        expect(user).to be_invalid
      end

      it 'is invalid if password does not contain number' do
        user = build(:user, password: 'password@A', password_confirmation: 'password@A')
        expect(user).to be_invalid
      end

      it 'is valid if password meets all requirements' do
        user = build(:user, password: 'Pas$w0rd!', password_confirmation: 'Pas$w0rd!')
        expect(user).to be_valid
      end
    end
  end
end
