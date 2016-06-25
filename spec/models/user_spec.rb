require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'validation' do
    subject { create(:user) }

    context '#username' do
      it { is_expected.to validate_length_of(:username).is_at_least(3).is_at_most(100) }
      it { is_expected.to allow_value('a1 .-@').for(:username) }
      it { is_expected.not_to allow_value('ああああ').for(:username) }
    end

    context '#password' do
      it { is_expected.to validate_length_of(:password).is_at_least(4) }
      it { is_expected.to validate_confirmation_of(:password) }
    end

    context '#crypted_password' do
      it { is_expected.not_to validate_presence_of(:crypted_password) }
    end

    context '#password_salt' do
      it { is_expected.not_to validate_presence_of(:password_salt) }
    end

    context '#persistence_token' do
      it { is_expected.not_to validate_presence_of(:persistence_token) }
      it { is_expected.to validate_uniqueness_of(:persistence_token) }
    end
  end
end
