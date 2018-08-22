set :output, './log/automagick.cron.log'
	every 1., :at => '13:00'  do 
	  runner "Admin::CronRequest.find(1).run!"
	end	

