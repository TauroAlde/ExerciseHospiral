class SignInRegistry < ActiveRecord::Base
  belongs_to :admin_user

  def self.to_day_login_for(user_id)
  	where(admin_user_id: user_id).
  	  where('login_day BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day).
  	  order(:login_day).first
  end
end
