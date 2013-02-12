define :time_window, :action => :run, :specifier => "", :recipe_list => [] do
	w = Chef::TimeWindow.new(params[:specifier])
	if w.include?(Time.now)
		Chef::Log.info("Current time is within time window \"#{params[:name]}\"")
		params[:recipe_list].each do |recipe|
			Chef::Log.info("Including recipe[#{recipe}]")
			include_recipe recipe
		end
	end
end
