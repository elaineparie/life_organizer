class Task < ActiveRecord::Base
  belongs_to :list

  def self.valid_params_name?(params)
  return !params[:task][:name].empty? && !params[:task][:importance].empty?
end

def self.valid_params_list?(params)
  if !params[:task][:name].empty? || !params[:task][:list_id].empty?
  end
end

def self.valid_params?(params)
  if self.valid_params_list?(params) && self.valid_params_name?(params)
  end
end

end
