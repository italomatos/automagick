set :output, './log/automagick.cron.log'
	every 1.days do 
	  runner "Admin::CronRequest.find(1).run!"
	end	

