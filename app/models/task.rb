class Task < ActiveRecord::Base
  belongs_to :list

  def self.valid_params?(params)
    !params[:task][:name].empty? && !params[:task][:importance].empty?
  end

  def self.valid_params_list?(params)
    !!params[:list][:name] || !!params[:task][:list_id]
  end

  def self.task_valid_params?(params)
    self.valid_params_list?(params) && self.valid_params?(params)
  end

end
