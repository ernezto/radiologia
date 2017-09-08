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
    let(:expected_clinics) { [create(:clinic), create(:clinic)] }

    before(:each) do
      doctor.clinics << clinic
      doctor.save!
    end

    it 'should add an existing clinic to a doctor' do
      doctor.reload
      expect(doctor.clinics).to include(clinic)
    end

    it 'should replace existing clinics with new ones' do
      doctor.clinics = expected_clinics
      doctor.save!
      doctor.reload
      expect(doctor.clinics).to eq(expected_clinics)
    end
  end
end
