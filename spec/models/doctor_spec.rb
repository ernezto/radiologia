require 'rails_helper'

describe Doctor do
  subject(:doctor) { Doctor.new(name: name) }
  let(:name) { Faker::Name.name }

  context '#valid?' do
    context 'when has all required fields' do
      it { is_expected.to be_valid }
    end

    context 'when name is missing' do
      let(:name) { nil }
      it { is_expected.to be_invalid }
    end
  end
end
