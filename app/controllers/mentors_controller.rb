class MentorsController < ApplicationController
 before_action :find_mentor, only: [:show, :dashboard]
 before_action :find_episode, only: [:index, :show, :dashboard]

 def index
   if params[:category].blank?
     @mentors = Mentor.all.order("created_at desc").paginate(:page => params[:page], :per_page => 12)
   else
     @category_id = Category.find_by(name: params[:category]).id
     @mentors = Mentor.where(category_id: @category_id).order("created_at desc").paginate(:page => params[:page], :per_page => 12)
   end
 end

 def show
 end

 def dashboard 
 end

 private
 def find_episode
  @episodes = Episode.friendly.where(mentor_id: @mentor).order("created_at desc").paginate(:page => params[:page], :per_page => 5)
 end

 def find_mentor
  if params[:id].nil?
    @mentor = current_mentor
  else
    @mentor = Mentor.friendly.find(params[:id])
  end
 end
end
