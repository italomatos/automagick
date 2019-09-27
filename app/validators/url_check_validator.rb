class UrlCheckValidator < ActiveModel::EachValidator
	def validate_each(record, attribute, value)
    	unless value =~ /https?:\/\/[\S]+/
      		record.errors[attribute] << (options[:message] || "is not a valid url")
    	end
  	end
end