class ListController  < ApplicationController

  get '/lists' do
    @lists = List.all
    erb :'lists/index'
  end

get "/lists/new" do
  erb :'lists/new'
end

get "/lists/:id" do
  @list = List.find(params[:id])
  erb :'lists/show'
end

post "/lists" do
    List.create(params)
    redirect "/lists"
end

end
