require "credentials"
require "menu"

class Role < ActiveRecord::Base
  serialize :cache
  validates_presence_of :name
  validates_uniqueness_of :name

  def Role.rebuild_cache
    roles = Role.find(:all)
    
    for role in roles do
      role.cache = nil ; role.save # we have to do this to clear it

      role.cache = Hash.new
      role.rebuild_credentials
      role.rebuild_menu
      role.save
    end
  end

  def rebuild_credentials
    self.cache[:credentials] = Credentials.new(self.id)
  end


  def rebuild_menu
    menu = Menu.new(self)
    self.cache[:menu] = menu
  end


  def get_parents
    parents = Array.new
    seen = Hash.new

    current = self.id
    
    while current
      role = Role.find(current)
      if role 
        if not seen.has_key?(role.id)
          parents << role
          seen[role.id] = true
          current = role.parent_id
        else
          current = nil
        end
      else
        current = nil
      end
    end

    return parents
  end

end
