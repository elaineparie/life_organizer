class User < ActiveRecord::Base
  has_many :lists

  has_secure_password

  def has_unique_username(params)
    @usernames = []
   User.all.each do |user|
     @usernames << user.username
   end
   !@usernames.include?(params[:username])
   # !User.find_by(username: params[:username])
  end


end
