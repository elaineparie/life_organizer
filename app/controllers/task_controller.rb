class TaskController  < ApplicationController

  get "/tasks" do
    if !Helpers.redirect_if_not_logged_in(session)
        redirect "/login?error=invalid request"
      end
    @tasks = Helpers.current_user(session).tasks
    erb :'tasks/index'
  end

  get "/tasks/new" do
    if !Helpers.redirect_if_not_logged_in(session)
        redirect "/login?error=invalid request"
      end
    @lists = Helpers.current_user(session).lists
    erb :'tasks/new'
  #  if params[:list_id]
  #    @list = List.find(params[:list_id])
  #  end
  #  erb :'tasks/new'
  end

  get "/tasks/:id" do
    if !Helpers.redirect_if_not_logged_in(session)
        redirect "/login?error=invalid request"
      end
    @task = Task.find(params[:id])
    if !Helpers.current_user(session).lists.include?(@task.list)
      redirect "/lists?error=cannot view that page"
    end
    erb :'tasks/show'
  end

  post "/tasks" do
    if !Helpers.redirect_if_not_logged_in(session)
        redirect "/login?error=invalid request"
      end
    if !Task.task_valid_params?(params)
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
  if !Helpers.redirect_if_not_logged_in(session)
      redirect "/login?error=invalid request"
    end
  @task = Task.find(params[:id])
  @task.delete
  redirect to '/lists'
end

end
