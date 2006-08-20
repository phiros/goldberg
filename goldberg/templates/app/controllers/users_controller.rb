class UsersController < ApplicationController

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def index
    list
    render :action => 'list'
  end

  def list
    @user_pages, @users = paginate :users, :order => 'name', :per_page => 50
  end

  def show
    @user = User.find(params[:id])
    if @user.role_id
      @role = Role.find(@user.role_id)
    else
      @role = Role.new(:id => nil, :name => '(none)')
    end
  end

  def new
    @user = User.new
    foreign
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'User was successfully created.'
      redirect_to :action => 'list'
    else
      foreign
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user.role_id
      @role = Role.find(@user.role_id)
    end
    foreign
  end

  def update
    @user = User.find(params[:id])
    if params[:user]['clear_password'] == ''
      params[:user].delete('clear_password')
    end

    if @user.update_attributes(params[:user])
      flash[:notice] = 'User was successfully updated.'
      redirect_to :action => 'show', :id => @user
    else
      foreign
      render :action => 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  protected

  def foreign
    @all_roles = Role.find(:all, :order => 'name')
  end

end
