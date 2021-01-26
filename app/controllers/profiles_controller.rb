class ProfilesController < ApplicationController
before_action :find_profile, only: [:edit, :update, :destroy]

def show
  @profile = Profile.find(1)
end

def new
    @profile = Profile.new
end

def create
     @profile = Profile.new(profile_params)
     if @profile.save
      redirect_to profile_path(@profile), notice: '作成できました'
    else
      render :new, alert: '作成できませんでした'
     end
end

def edit
    
end

def update
  if @profile.update(update_params)
    redirect_to profile_path(@profile), notice: '更新できました'
  else
    render :edit,　alert: '更新できませんでした'
  end
end

def destory
    if @profile.destory
      redirect_to profile_path, notice: '削除に成功しました'
    else
      redirect_to profile_path, alert: '削除できませんでした'
    end
end


 private
  def find_profile
    @profile = Profile.find(params[:id])
  end
  
  def profile_params
     params.require(:profile).permit(:text, :body, :image)
  end  
    
  def update_params
     params.require(:profile).permit(:text, :body, :image)
  end
end
