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

  context '#save' do
    it 'should create a new doctor' do
      expect{ doctor.save }.to change(Doctor, :count).by(1)
    end
  end

  context 'when saving clinic relashionship' do
    let(:clinic) { create(:clinic) }
    it 'should create a clinic for a doctor' do
      doctor.save
      doctor.clinics.create(:clinic)
      expect { doctor.save }.to change(Clinic, :count).by(1)
    end
  end
end