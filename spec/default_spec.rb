require_relative 'spec_helper'

describe 'foreman::default' do
  include_context 'foreman_stubs'

  describe 'ubuntu' do
    cached(:subject) do
      ChefSpec::ServerRunner.new.converge(described_recipe)
    end

    it 'should includes recipes' do
      expect(subject).to include_recipe('hostname')
      expect(subject).to include_recipe('foreman::install')
      expect(subject).to include_recipe('foreman::config')
      expect(subject).to include_recipe('foreman::database')
      expect(subject).to include_recipe('foreman::service')
    end

    it 'should reload ohai' do
      expect(subject).to reload_ohai('reload')
    end
  end
end
