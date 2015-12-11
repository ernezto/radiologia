require 'rails_helper'

describe Clinic do

  context '#validation' do
    let(:clinic) { create :clinic }

    it 'should be valid when has a name' do
      expect(clinic).to be_valid
    end

    it 'should be invalid when no name is provided' do
      clinic.name = nil
      expect(clinic).to be_invalid
    end

    it 'should be valid without address' do
      clinic.address = nil
      expect(clinic).to be_valid
    end

    it 'should be valid without phone number' do
      clinic.phone = nil
      expect(clinic).to be_valid
    end
  end
end
