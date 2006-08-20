class SiteController < ActiveRecord::Base

  validates_uniqueness_of :name
  attr_accessor :permission

  def permission
    @permission ||= Permission.find_by_id(self.permission_id)
    return @permission
  end

  def actions
    @actions ||= ControllerAction.find(:all,
                                       :conditions =>
                                       "site_controller_id = #{self.id}",
                                       :order => 'name')
  end

end
