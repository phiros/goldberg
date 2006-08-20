class SiteControllersController < ApplicationController

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def index
    list
    render :action => 'list'
  end

  def list
    # @site_controller_pages, @site_controllers = paginate :site_controllers, :per_page => 10
    @builtin_site_controllers = SiteController.find(:all,
                                            :conditions => "builtin = 1",
                                            :order => 'name')
    @app_site_controllers = 
      SiteController.find(:all,
                          :conditions => "builtin is null or builtin = 0",
                          :order => 'name')
  end

  def show
    @site_controller = SiteController.find(params[:id])
    @actions = ControllerAction.find(:all,
                                     :conditions => ['site_controller_id = ?',
                                                     params[:id] ],
                                     :order => 'name')
  end

  def new
    foreign
    @site_controller = SiteController.new
  end

  def create
    @site_controller = SiteController.new(params[:site_controller])
    if @site_controller.save
      flash[:notice] = 'SiteController was successfully created.'
      Role.rebuild_cache
      redirect_to :action => 'list'
    else
      foreign
      render :action => 'new'
    end
  end

  def edit
    @site_controller = SiteController.find(params[:id])
    foreign
  end

  def update
    @site_controller = SiteController.find(params[:id])
    if @site_controller.update_attributes(params[:site_controller])
      flash[:notice] = 'SiteController was successfully updated.'
      Role.rebuild_cache
      redirect_to :action => 'show', :id => @site_controller
    else
      foreign
      render :action => 'edit'
    end
  end

  def destroy
    SiteController.find(params[:id]).destroy
    Role.rebuild_cache
    redirect_to :action => 'list'
  end

  protected 

  def foreign
    @permissions = Permission.find(:all, :order => 'name')
  end

end
