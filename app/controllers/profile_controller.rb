class ProfileController < ApplicationController
    # Create a instance of GithubApiService
    before_action :setGithubSearch, only: %i[ fetch fetchProfileByUser getProfileByUser create ]
    #before_action :set_userProfile, only: %i[ destroy ]
    
  def getProfileByUser
    if params.has_key?(:user_login)
      @searchProfiles = @searchProfiles.getUser(params[:user_login]);
      logger.debug "Parrams :: #{@searchProfiles}"
    else
      @searchProfiles = Array.new
    end
  end

  def fetchProfileByUser
    if params.has_key?(:user_login)
      redirect_to action: "getProfileByUser", user_login: params[:user_login]
    else
      respond_to do |format|
          format.html { redirect_to getProfileByUser_path, alert: "User does not exist." }
          format.json { render :getProfileByUser, status: :created, location: profile_show_path }
      end
    end
  end

  def fetch
    @githubProfiles = @searchProfiles.getUsers(20)
  end

  def show
    #@userProfile = UserProfile.all.order(updated_at: :desc)
  end

  def compare
    @leftUser = UserProfile.find(params[:leftUser])
    @rightUser = UserProfile.find(params[:rightUser])
  end

  def create
    # Get the user from github api
    @searchProfiles = @searchProfiles.getUser(params[:user_login]);

    #  Create a user to be stored
    profile = createProfileObj(@searchProfiles)
    @profile = UserProfile.new(profile);

    respond_to do |format|
      if @profile.save
        format.html { redirect_to storedProfiles_path, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: profile_show_path }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @userProfile.destroy
    respond_to do |format|
      format.html { redirect_to storedProfiles_path, alert: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private 
  def setGithubSearch
    @searchProfiles = GithubApiService.new
  end
  
  def set_userProfile
    #@userProfile = UserProfile.find(params[:id])
  end

  def createProfileObj(obj)
    newObj = {
      node_id: obj['node_id'], 
      login: obj['login'], 
      name: obj['name'], 
      url: obj['url'], 
      avatar_url: obj['avatar_url'], 
      bio: obj['bio'], 
      public_repos: obj['public_repos'], 
      followers: obj['followers'], 
      following: obj['following']
    }
    return newObj
  end
end
