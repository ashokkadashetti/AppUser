class User < ApplicationRecord


	validates :name, 
			   presence: true, 
			   uniqueness: true, 
			   length: {minimum:3, maximum:10}, 
			   format: {:with => /\A[^0-9`:;!@#\$%\^&*+_=]+\z/}

	validates :email, 
			   presence: true, 
			   uniqueness: true,
			   length:{maximum:30}, 
			   format: {with: URI::MailTo::EMAIL_REGEXP}





	has_many :posts, 
			  dependent: :destroy 


	accepts_nested_attributes_for  :posts, 
								   :reject_if => proc {|attrs| attrs['description'].blank?},
								   :allow_destroy => true,
								   :update_only => true






	
	#.........................................................................................................................................
	#:format => { :with => ~/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
	#format: {with: URI::MailTo::EMAIL_REGEXP}								  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	# 																		  /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

	#.........................................................................................................................................
	
	#validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP, presence: true, uniqueness: true

	#.........................................................................................................................................

	# def name_validation(name)
	# 	:presence => true,
	# 	:uniqueness => true,
	# 	:length => {:minimum => 3
	# 			 	:maximum => 10},
	# 	:format => {:with => /\A[^0-9`!@#\$%\^&*+_=]+\z/}
	# end

#...........................................................................................................

	# def email_validation(:email)

		
	# 	:presence => true,
	# 	:uniqueness => true,
	# 	:format =>  {:with => URI::MailTo::EMAIL_REGEXP},
	# 	:length => {:maximum => 30} 
	# end


#...........................................................................................................
	



end

