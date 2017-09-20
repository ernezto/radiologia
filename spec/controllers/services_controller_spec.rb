require 'rails_helper'

describe ServicesController, type: :controller do
  let(:user) { create(:user) }
  before(:each) { sign_in(user) }
  it 'should be an instance of a secure controller' do
    expect(ServicesController.new).to be_a(SecureApplicationController)
  end

  describe '#index' do
    let(:service) { create(:service) }
    it 'should return all services' do
      get :index
      expect(assigns(:services)).to contain_exactly(service)
    end
  end
end
