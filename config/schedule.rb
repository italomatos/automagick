set :output, './log/automagick.cron.log'
	every 5.hour, :at => '13:00'  do 
	  runner "Admin::CronRequest.find(1).run!"
	end	

	every 3.hour, :at => '3:00'  do 
	  runner "Admin::CronRequest.find(2).run!"
	end	

