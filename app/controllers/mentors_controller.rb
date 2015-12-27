class MentorsController < ApplicationController
 before_action :find_mentor, only: [:show, :dashboard]
 before_action :find_episode, only: [:show, :dashboard]

 def index
  @mentors = Mentor.all.order("created_at desc").paginate(:page => params[:page], :per_page => 12)
 end

 def show
 end

 def dashboard 
 end

 private
 def find_episode
  @episodes = Episode.where(mentor_id: @mentor).order("created_at desc").paginate(:page => params[:page], :per_page => 5)
 end

 def find_mentor
  if params[:id].nil?
    @mentor = current_mentor
  else
    @mentor = mentor.find(params[:id])
  end
 end
end
