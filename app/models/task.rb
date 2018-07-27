class Task < ActiveRecord::Base
  belongs_to :list

  def self.not_valid_params?(params)
  return params[:task][:name].empty? || !params[:task][:list_id].empty? || !params[:list][:name].empty?
end
end
