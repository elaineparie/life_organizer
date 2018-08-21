class TaskController  < ApplicationController

  get "/tasks" do
    redirect_if_not_logged_in
    @tasks = Task.all
    erb :'tasks/index'
  end

  get "/tasks/new" do
    redirect_if_not_logged_in
    @lists = current_user.lists
    erb :'tasks/new'
  #  if params[:list_id]
  #    @list = List.find(params[:list_id])
  #  end
  #  erb :'tasks/new'
  end

  get "/tasks/:id" do
    redirect_if_not_logged_in
    @task = Task.find(params[:id])
    erb :'tasks/show'
  end

  post "/tasks" do
    binding.pry
  redirect_if_not_logged_in
    if !Task.valid_params?(params)
      redirect "/tasks/new?error=invalid list"
    end
    @task = Task.create(params[:task])
  if !params[:list][:name].empty?
    @list = List.create(params[:list])
    @task.list = @list
    @list.save
    Helpers.current_user(session).lists << @list
  end
  @task.save
  redirect "/lists/#{@task.list.id}"
end

delete '/tasks/:id/delete' do
  redirect_if_not_logged_in
  @task = Task.find(params[:id])
  @task.delete
  redirect to '/lists'
end

end
