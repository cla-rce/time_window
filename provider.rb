action :run do	
	w = Chef::TimeWindow.new(new_resource.specifier)
	if w.include?(Time.now)
		Chef::Log.warn("Current time is within range")
		new_resource.run_list.each do |recipe|
			@run_context.include_recipe recipe
		end
	end
end