class EpisodesController < ApplicationController
 before_action :authenticate_mentor!, except: [:show]
 before_filter :require_permission
 before_action :find_mentor
 before_action :find_episode, only: [:show, :edit, :update, :destroy]

 def new
  @episode =@mentor.episodes.new
 end

 def create
  @episode = @mentor.episodes.new episode_params
  if episode.save
   redirect_to mentor_episode_path(@mentor, @episode)
  else
   render 'new'
  end
 end 

 def show
  @episode = Episode.where(mentor_id: @mentor.order("created_at desc").limit(5).reject { |e| e.id ==@episode.id}  
 end

 def edit
 end

 def update
  if @episode.update episode_params
   redirect_to mentor_episode_path(@mentor, @episode), notice:"Episode was successfully updated!"
  else
   render 'edit'  
  end
 end

 def destroy
  @episode.destroy
  redirect_to root_path
 end

 private
 def episode_params
  params.require(:episode).permit(:title, :description, :episode_thumbnail, :mp3)
 end

 def find_mentor
  @mentor = mentor.find(params[:mentor_id])
 end

 def find_episode
  @episode = Episode.find(params[:id])
 end

 def require_permission
  @mentor = mentor.find(params[:mentor_id])
  if current_mentor != @mentor
   redirect_to root_path, notice: "Please sign up with the right credentials to view that post."
  end
 end

end
