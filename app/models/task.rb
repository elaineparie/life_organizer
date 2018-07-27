class Task < ActiveRecord::Base
  belongs_to :list

  def self.valid_params?(params)
  return !params[:task][:name].empty? && !params[:task][:list_id].empty?
end
end
