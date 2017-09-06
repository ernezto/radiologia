require 'rails_helper'

describe Clinic do
  subject(:clinic) { Clinic.new(name: name, address: address, phone: phone)}
  let(:name) { Faker::Name.name }
  let(:address) { Faker::Address.street_address }
  let(:phone) { Faker::PhoneNumber.phone_number }

  context '#validation' do
    context 'when has all required fields' do
      let(:phone) { nil }
      it { is_expected.to be_valid }
    end

    context 'when name is not provided' do
      let(:name) { nil }
      it { is_expected.to be_invalid }
    end

    context 'when address is not provided' do
      let(:address) { nil }
      it { is_expected.to be_invalid }
    end
  end
end
