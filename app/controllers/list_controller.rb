class ListController  < ApplicationController

  get '/lists' do
    @lists = List.all
    erb :'lists/index'
  end

get "/lists/new" do
  erb :'lists/new'
end

get "/lists/:id/edit" do
  @list = List.find(params[:id])
  erb :'lists/edit'
end

post "/lists/:id" do
  @list = List.find(params[:id])
  @list.update(params)
  @task = Task.find(params[:id])
  redirect "/lists/#{@list.id}"
end

get "/lists/:id" do
  @list = List.find(params[:id])
#  @task = Task.find_by(params[:id])
  erb :'lists/show'
end

post "/lists" do
    List.create(params)
    redirect "/lists"
end

delete '/lists/:id/delete' do
  @list = List.find_by(params[:id])
  @list.delete
redirect to '/lists'
end


end
