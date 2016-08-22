#
# Cookbook Name:: virtualbox
# Attributes:: default
#
# Copyright 2011, Joshua Timberman
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


default['virtualbox']['url'] = ''
default['virtualbox']['version'] = ''

case node['platform_family']
when 'mac_os_x'
  default['virtualbox']['url'] = 'http://download.virtualbox.org/virtualbox/4.2.12/VirtualBox-4.2.12-84980-OSX.dmg'
when 'windows'
  default['virtualbox']['url'] = 'http://download.virtualbox.org/virtualbox/4.2.12/VirtualBox-4.2.12-84980-Win.exe'
  default['virtualbox']['version'] = Vbox::Helpers.vbox_version(node['virtualbox']['url'])
when 'debian', 'rhel', 'fedora'
  if node['platform'] == 'debian' && Chef::VersionConstraint.new('>= 8.0').include?(node['platform_version']) ||
     node['platform'] == 'ubuntu' && Chef::VersionConstraint.new('>= 16.04').include?(node['platform_version'])
    default['virtualbox']['version'] = '5.1'
    default['virtualbox']['apt']['key'] = 'https://www.virtualbox.org/download/oracle_vbox_2016.asc'
  else
    default['virtualbox']['version'] = '4.3'
    default['virtualbox']['apt']['key'] = 'http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc'
  end
end
