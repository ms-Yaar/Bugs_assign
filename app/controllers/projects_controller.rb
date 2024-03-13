class ProjectsController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource 
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    #@projects=Project.all
        @projects = Project.accessible_by(current_ability)

    end

    def show
     
    
        @project = Project.find(params[:id])

      
    end
    
  
    def edit
      @project=Project.find(params[:id])
  
    end
  
    def new
      @project=Project.new
    end
  
    def create
      @project = Project.new(project_params)
      @project.creator_id = current_user.id
     

      if @project.save
        @user=@project.user
        
        MyFirstJob.perform_in(5.seconds,@user.id)

        redirect_to projects_path, notice: 'Project was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end
   
    
  
    def destroy
      @project = Project.find(params[:id])
      @project.destroy
  
      redirect_to root_path, status: :see_other
    end
    
    def edit
      @project=Project.find(params[:id])
    end
  
    def update
      @project=Project.find(params[:id])
      
  
      if @project.update(project_params)
        redirect_to projects_path, notice: 'Project was successfully Update.'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
   
    
     private
  
  def project_params
    params.require(:project).permit(:name, :user_id,:creator_id)
  
  end

   def set_project
    @project = Project.find(params[:id])
  end



  
end
