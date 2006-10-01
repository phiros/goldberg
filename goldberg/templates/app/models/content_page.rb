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


  def markup_style
    if not @markup_style and self.markup_style_id and self.markup_style_id > 0
      @markup_style = MarkupStyle.find(self.markup_style_id)
    end
    return @markup_style
  end


  def content_html
    if not @content_html
      markup = self.markup_style
      if markup and markup.name
        if markup.name == 'Textile'
          @content_html = RedCloth.new(self.content).to_html(:textile)
        elsif markup.name == 'Markdown'
          @content_html = RedCloth.new(self.content).to_html(:markdown)
        else
          @content_html = self.content
        end
      else
        @content_html = self.content
      end
    end
    return @content_html
  end

end
