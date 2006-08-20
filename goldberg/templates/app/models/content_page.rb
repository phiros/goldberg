require 'bluecloth'
require 'redcloth'

class ContentPage < ActiveRecord::Base
  
  validates_uniqueness_of :name

  attr_accessor :content_html

  def self.find_for_permission(p_ids)
    if p_ids and p_ids.length > 0
      return find(:all, 
                  :conditions => ['permission_id in (?)', p_ids],
                  :order => 'name')
    else
      return Array.new
    end
  end

  def url
    return "/#{self.name}"
  end

  def content_html
    @content_html ||= RedCloth.new(self.content).to_html
  end

end
