class TaskController  < ApplicationController

  get "/tasks" do
    @tasks = Task.all
    erb :'tasks/index'
  end

  get "/tasks/new" do
    @lists = List.all
  erb :'tasks/new'
end

post "/tasks" do
  @task = Task.create(params[:task])
  if params[:list][:name].empty?
    @task.list = List.create(params[:list])
end
@task.save
  redirect "/lists/#{@task.list.id}"
end

end
