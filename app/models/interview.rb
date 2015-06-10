class Interview < ActiveRecord::Base
  belongs_to :user
  belongs_to :candidate

  after_save :interview_mail

  def interview_mail
		UserMailer.interview_mail(self).deliver_later  	
  end
end

WillPaginate.per_page = 4