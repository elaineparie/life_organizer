class ListController  < ApplicationController

  get '/lists' do
    redirect_if_not_logged_in
    @lists = List.all
    erb :'lists/index'
  end

get "/lists/new" do
  redirect_if_not_logged_in
  erb :'lists/new'
end

get "/lists/:id/edit" do
  redirect_if_not_logged_in
  @list = List.find(params[:id])
  erb :'lists/edit'
end

post "/lists/:id" do
  redirect_if_not_logged_in
  unless List.valid_params?(params)
      redirect "/lists/new?error=invalid list"
    end
  @list = List.find(params[:id])
  @list.update(params)
  @task = Task.find(params[:id])
  redirect "/lists/#{@list.id}"
end

get "/lists/:id" do
  redirect_if_not_logged_in
  @list = List.find(params[:id])
  @tasks = @list.tasks.order("importance DESC")
  erb :'lists/show'
end

post "/lists" do
  redirect_if_not_logged_in
  unless List.valid_params?(params)
      redirect "/lists/new?error=invalid list"
    end
    @list = List.create(params)
    @list.save
    redirect "/lists"
end

delete '/lists/:id/delete' do
  redirect_if_not_logged_in
  @list = List.find(params[:id])
  @list.delete
redirect to '/lists'
end


end
