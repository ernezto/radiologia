require 'rails_helper'

describe DoctorsController, type: :controller do
  let(:doctor) { build(:doctor) }
  let(:doctor_params) { doctor.attributes.merge({clinics: doctor.clinics.map(&:id)}) }
  let(:user) { create(:user) }
  before(:each) { sign_in(user) }

  it 'should be an instance of a secure controller' do
    expect(DoctorsController.new).to be_a(SecureApplicationController)
  end

  describe '.create' do
    subject(:create_doctor) { post :create, doctor: doctor_params }
    before { post :create, doctor: doctor_params }

    context 'on success' do
      it { is_expected.to redirect_to(doctors_path) }
      it { expect(flash).to have_attributes(notice: 'Doctor creado satisfactoriamente') }
      it { expect{ create_doctor }.to change { Doctor.count }.by(1) }

      it 'should assign existing clinics when creating a doctor' do
        actual_doctor = Doctor.find_by_name(doctor.name)
        expect(actual_doctor.clinics).to eq(doctor.clinics)
      end
    end

    context 'on failure' do
      let(:doctor) { Doctor.new }
      it { is_expected.to redirect_to(new_doctor_path) }
      it { expect(flash).to have_attributes(notice: 'Error creando el doctor') }
    end
  end
end
