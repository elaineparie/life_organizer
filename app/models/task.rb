class Task < ActiveRecord::Base
  belongs_to :list

  def self.valid_params?(params)
  return !params[:task][:name].empty? && !params[:task][:importance].empty?
end
end
