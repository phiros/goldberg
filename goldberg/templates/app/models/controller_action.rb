class ControllerAction < ActiveRecord::Base

  validates_uniqueness_of :name, :scope => 'site_controller_id'

  attr_accessor :controller, :permission, :url

  def controller
    @controller ||= SiteController.find(self.site_controller_id)
  end

  def permission
    if not @permission
      if self.permission_id
        @permission = Permission.find_by_id(self.permission_id)
      else
        @permission = Permission.new(:id => nil, 
                                     :name => "(default -- #{self.controller.permission.name})")
      end
    end
    return @permission
  end

  def fullname
    if self.site_controller_id > 0
      return "#{self.controller.name}: #{self.name}"
    else
      return "#{self.name}"
    end
  end

  def url
    @url ||= "/#{self.controller.name}/#{self.name}"
    return @url
  end

  def self.find_for_permission(p_ids)
    if p_ids and p_ids.length > 0
      return find(:all, 
                  :conditions => ['permission_id in (?)', p_ids],
                  :order => 'name')
    else
      return Array.new
    end
  end

end
