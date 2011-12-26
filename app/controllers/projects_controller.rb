class ProjectsController < ApplicationController
before_filter :confirm_logged_in , :except => [:login, :attempt_login, :logout]
layout "admin"
  # GET /projects
  # GET /projects.xml
  def index
    @projects = Project.paginate(:page => params[:page], :per_page => 5)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
	@projects = Project.find(:all)
	@developers = Developer.find(:all)
    @project = Project.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
  end


  
  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
	@developers = Developer.find(:all)
  
  end

  # POST /projects
  # POST /projects.xml
  def create
    @project = Project.new(params[:project])
    @developers = Developer.find(:all)
	checked_developers = check_developers_using(params[:developer_list])
    uncheck_missing_developers(@developers, checked_developers)
    respond_to do |format|
      if @project.save
        format.html { redirect_to(@project, :notice => 'Project was successfully created.') }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end


  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    @project = Project.find(params[:id])
 @developers = Developer.find(:all)
 checked_developers = check_developers_using(params[:developer_list])
    uncheck_missing_developers(@developers, checked_developers)
    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to(@project, :notice => 'Project was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.xml  { head :ok }
    end
  end
  private #-------------------------
  
  def check_developers_using( developer_id_array )
    checked_developers = []
    checked_params = developer_id_array || []
    for check_box_id in checked_params
      developer = Developer.find(check_box_id)
      if not @project.developers.include?(developer)
        @project.developers << developer
      end
      checked_developers << developer
    end
    return checked_developers
  end
  
  def uncheck_missing_developers( developers, checked_developers)
    missing_developers = developers- checked_developers
    for developer in missing_developers
      if @project.developers.include?(developer)
         @project.developers.delete(developer)
       end
    end
  end
end



  

  

  
  
  
  
