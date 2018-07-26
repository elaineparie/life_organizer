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
  redirect to '/lists'
  end
end

get '/login' do
    #if !session[:user_id]
      erb :'users/login'
  #  else
  #    redirect '/lists'
  #  end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/lists"
    else
      redirect to '/signup'
    end
  end


end
