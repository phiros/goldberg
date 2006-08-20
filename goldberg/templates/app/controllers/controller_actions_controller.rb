class ControllerActionsController < ApplicationController

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def index
    list
    render :action => 'list'
  end

  def list
    # @controller_action_pages, @controller_actions = paginate :controller_actions, :per_page => 50, :order => 'site_controller_id, name'
    @controller_actions = ControllerAction.find(:all,
                                                :order => 'name')
  end

  def show
    @controller_action = ControllerAction.find(params[:id])
    if @controller_action.permission_id
      @permission = Permission.find(@controller_action.permission_id)
    else
      @permission = Permission.new(:id => nil, :name => '(default)')
    end
  end

  def new
    @controller_action = ControllerAction.new
    foreign
  end

  def new_for
    @controller_action = ControllerAction.new
    @controller_action.site_controller_id = params[:id]
    foreign
    render :action => 'new'
  end

  def create
    @controller_action = ControllerAction.new(params[:controller_action])
    if @controller_action.save
      flash[:notice] = 'ControllerAction was successfully created.'
      Role.rebuild_cache
      redirect_to :controller => 'site_controllers', :action => 'show',
      :id => @controller_action.site_controller_id
    else
      foreign
      render :action => 'new'
    end
  end

  def edit
    @controller_action = ControllerAction.find(params[:id])
    foreign
  end

  def update
    @controller_action = ControllerAction.find(params[:id])
    if @controller_action.update_attributes(params[:controller_action])
      flash[:notice] = 'ControllerAction was successfully updated.'
      Role.rebuild_cache
      redirect_to :controller => 'site_controllers', :action => 'show',
      :id => @controller_action.site_controller_id
    else
      foreign
      render :action => 'edit'
    end
  end

  def destroy
    @controller_action = ControllerAction.find(params[:id])
    site_controller_id = @controller_action.site_controller_id
    @controller_action.destroy
    Role.rebuild_cache
    redirect_to :controller => 'site_controllers', :action => 'show',
    :id => @controller_action.site_controller_id
  end

  protected
  
  def foreign
    @controllers = SiteController.find(:all, :order => 'name')
    
    @permissions = Permission.find(:all, :order => 'name')
    @permissions.unshift Permission.new(:id => nil, :name => '(default)')
  end
    
end
