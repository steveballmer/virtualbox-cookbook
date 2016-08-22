require 'spec_helper'

describe 'virtualbox::default' do
  context 'on Centos 6.4 x86_64 with virtualbox 4.3' do
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'centos', version: 6.4, step_into: ['yum_repository']) do |node|
        node.automatic['kernel']['machine'] = 'x86_64'
        node.default['virtualbox']['version'] = 4.3
      end.converge(described_recipe)
    end

    # Regression test against stupid typos
    it 'creates repository with download.virtualbox.org/virtualbox/rpm/rhel/$releasever/$basearch' do
      expect(chef_run).to create_yum_repository('oracle-virtualbox').with(url: 'http://download.virtualbox.org/virtualbox/rpm/rhel/$releasever/$basearch')
    end

  end

  context 'on Ubuntu 16.04 with virtualbox 5.1' do
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'ubuntu', version: 16.04).converge(described_recipe)
    end

    it 'adds virtual box repository' do
      expect(chef_run).to add_apt_repository('oracle-virtualbox').with(
        uri: 'http://download.virtualbox.org/virtualbox/debian',
        key: 'https://www.virtualbox.org/download/oracle_vbox_2016.asc'
      )
    end

    it 'installs virtualbox package' do
      expect(chef_run).to install_package('virtualbox-5.1')
    end

    it 'installs dkms package' do
      expect(chef_run).to install_package('dkms')
    end
  end
end
