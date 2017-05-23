require 'spec_helper'
describe 'cloudbreak' do
  context 'with default values for all parameters' do
    it { should contain_class('cloudbreak') }
  end
end
