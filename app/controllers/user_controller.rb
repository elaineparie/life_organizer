class UserController  < ApplicationController

  get '/signup' do
      erb :'/users/new'
  end

  post '/signup' do
  if params[:username].empty? || params[:password].empty?
    redirect to '/signup'
  else
    @user = User.create(params)
    @user.save
  session[:user_id] = @user.id
  end
end

end
