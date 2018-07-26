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
  @task = Task.create(params)
  redirect "/lists/#{@task.list.id}"
end

end
