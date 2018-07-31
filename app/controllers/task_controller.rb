class TaskController  < ApplicationController

  get "/tasks" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @tasks = Task.all
    erb :'tasks/index'
  end

  get "/tasks/new" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @lists = List.all
  erb :'tasks/new'
end

get "/tasks/:id" do
  redirect_if_not_logged_in
  @error_message = params[:error]
    @task = Task.find(params[:id])
  erb :'tasks/show'
end

post "/tasks" do
  redirect_if_not_logged_in
  unless Task.valid_params?(params)
      redirect "/tasks/new?error=invalid list"
    end
  @task = Task.create(params[:task])
  if !params[:list][:name].empty?
    @task.list = List.create(params[:list])
end
@task.save
  redirect "/lists/#{@task.list.id}"
end

delete '/tasks/:id/delete' do
  redirect_if_not_logged_in
  @error_message = params[:error]
  @task = Task.find(params[:id])
  @task.delete
  redirect to '/lists'
end




end
