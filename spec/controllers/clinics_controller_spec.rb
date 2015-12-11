require 'rails_helper'

describe ClinicsController do

  context 'when signed in' do

    let!(:clinic) { build :clinic }
    let(:user) { create :user }

    before :each do
      sign_in user
    end

    context '#list' do
      it 'should list all the clinics' do
        allow(Clinic).to receive(:all).and_return([clinic])
        get :index
        expect(assigns(:clinics)).to contain_exactly clinic
      end
    end

    context '#new' do
      it 'should create a new clinic' do
        get :new
        expect(assigns(:clinic)).to_not be_nil
      end
    end

    context '#create' do
      it 'should redirect to index on success' do
        post :create, clinic: attributes_for(:clinic)
        expect(response).to redirect_to(clinics_path)
        expect(flash['notice']).to eq('Clínica creada satisfactoriamente')
      end

      it 'should redirect to new on failure' do
        post :create, clinic: attributes_for(:clinic, name: nil)
        expect(response).to redirect_to(new_clinic_path)
        expect(flash['notice']).to eq('Error creando una clínica')
      end

      it 'should create a clinic' do
        expect {
          post :create, clinic: attributes_for(:clinic)
        }.to change(Clinic, :count).by(1)
      end
    end
  end
end

