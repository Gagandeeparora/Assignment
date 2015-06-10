class UserMailer < ApplicationMailer

	def interview_mail(interview)
		@interview = interview
		mail(to: @interview.user.email, subject: "Scheduled an Interview")		
	end
end
