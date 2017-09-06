require 'rails_helper'
require 'faker'

describe ClinicsController do

  context 'when signed in' do
    let(:clinic) { build :clinic }
    let(:user) { create :user }
    before (:each) { sign_in user }

    describe '#list' do
      it 'should list all the clinics' do
        allow(Clinic).to receive(:all).and_return([clinic])
        get :index
        expect(assigns(:clinics)).to contain_exactly clinic
      end
    end

    describe '#new' do
      it 'should create a new clinic' do
        get :new
        expect(assigns(:clinic)).to_not be_nil
      end
    end

    describe '#update' do
      let(:clinic_params) { clinic.attributes }

      before(:each) { clinic.save }

      it 'should redirects to index on success' do
        put :update, id: clinic, clinic: clinic_params
        expect(response).to redirect_to(clinics_path)
        expect(flash['notice']).to eq('Datos actualizados satisfactoriamente')
      end

      it 'should update clinic changes' do
        attributes = clinic.attributes
        attributes['name'] = Faker::Company.name

        put :update, id: clinic, clinic: attributes
        clinic.reload
        expect(clinic.name).to eq(attributes['name'])
      end
    end

    describe '#create' do
      context 'when success' do
        it 'should redirect to index' do
          post :create, clinic: attributes_for(:clinic)
          expect(response).to redirect_to(clinics_path)
          expect(flash['notice']).to eq('Clínica creada satisfactoriamente')
        end
        it 'should create a clinic' do
          post :create, clinic: attributes_for(:clinic)
          expect(assigns(:clinic)).to be_persisted
        end
      end

      context 'when failure' do
        it 'should redirect to new' do
          post :create, clinic: attributes_for(:clinic, name: nil)
          expect(response).to redirect_to(new_clinic_path)
          expect(flash['notice']).to eq('Error creando una clínica')
        end
      end
    end
  end
end

