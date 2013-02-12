#
# Cookbook Name:: time_window
# Recipe:: data_bag
#
# Copyright 2013, Adam Mielke, (C) Regents of the University of Minnesota
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

data_bag(node['time_window']['databag_name']).each do |window_id|
  window = data_bag_item(node['time_window']['databag_name'], window_id)
  # given the full list of windows from a data bag, see if any should be applied to this node
  match_roles = window['roles'] & node['roles']
  if match_roles and not match_roles.nil? and not match_roles.empty?
  	time_window window['id'] do
  		specifier window['specifier']
  		recipe_list window['recipe_list']
  	end
  end
end