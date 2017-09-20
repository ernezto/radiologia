require 'rails_helper'

describe DoctorsController, type: :controller do
  let(:doctor) { build(:doctor) }
  let(:doctor_params) { doctor.attributes }
  let(:user) { create(:user) }
  before(:each) { sign_in(user) }

  it 'should be an instance of a secure controller' do
    expect(DoctorsController.new).to be_a(SecureApplicationController)
  end

  describe '#create' do
    context 'on success' do
      subject(:create_doctor) { post :create, doctor: doctor_params }
      it 'should redirect with notification' do
        expect(create_doctor).to redirect_to(doctors_path)
        expect(flash[:notice]).to eq('Doctor creado satisfactoriamente')
      end

      it 'should create a new doctor' do
        expect{ post :create, doctor: doctor_params }.to change { Doctor.count }.by(1)
      end

      it 'should assign existing clinics when creating a doctor' do
        clinics = [create(:clinic), create(:clinic)]
        doctor_params['clinics'] = clinics.map(&:id)
        post :create, doctor: doctor_params
        actual_doctor = Doctor.find_by_name(doctor.name)
        expect(actual_doctor.clinics).to eq(clinics)
      end
    end
  end
end
