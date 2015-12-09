require 'rails_helper'

describe 'clinic' do
  it 'should be valid when has a name' do
    expect(create(:clinic)).to be_valid
  end
  it 'should be valid without address'
  it 'should be valid without phone number'
end
