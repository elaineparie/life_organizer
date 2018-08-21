class ListController  < ApplicationController

  get '/lists' do
Helpers.redirect_if_not_logged_in(session)
    @lists = Helpers.current_user(session).lists
    erb :'lists/index'
  end


  get "/lists/new" do
  Helpers.redirect_if_not_logged_in(session)
    erb :'lists/new'
  end


  get "/lists/:id/edit" do
  Helpers.redirect_if_not_logged_in(session)
    @list = List.find(params[:id])
  erb :'lists/edit'
end


  post "/lists/:id" do
  Helpers.redirect_if_not_logged_in(session)
    unless List.valid_params?(params)
      redirect "/lists/new?error=invalid list"
    end
    @list = List.find(params[:id])
    @list.update(name: params[:name])
    @task = Task.find(params[:id])
    redirect "/lists/#{@list.id}"
  end


get "/lists/:id" do
  Helpers.redirect_if_not_logged_in(session)
  @list = List.find(params[:id])
  if !Helpers.current_user(session).lists.include?(@list)
    redirect "/lists?error=cannot view that page"
  end
  @tasks = @list.tasks.order("importance DESC")
  erb :'lists/show'
end


  post "/lists" do
Helpers.redirect_if_not_logged_in(session)
    unless List.valid_params?(params)
      redirect "/lists/new?error=invalid list"
    end
    @list = List.create(params)
    @list.save
    Helpers.current_user(session).lists << @list
    redirect "/lists"
    end


  delete '/lists/:id/delete' do
  Helpers.redirect_if_not_logged_in(session)
  @list = List.find(params[:id])
  if !Helpers.current_user(session).lists.include?(@list)
    redirect "/lists?error=cannot view that page"
  end
  @list.delete
  redirect to '/lists'
  end



end
