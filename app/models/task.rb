class Task < ActiveRecord::Base
  belongs_to :list

  def self.valid_params?(params)
    return !params[:task][:name].empty? && !params[:task][:importance].empty?
  end

  def self.valid_params_list?(params)
    if !!params[:list][:name] || !!params[:task][:list_id]
    end
  end

  def self.task_valid_params?(params)
    if self.valid_params_list?(params) && self.valid_params_name?(params)
    end
  end

end
