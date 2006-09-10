class MenuItem < ActiveRecord::Base
  validates_uniqueness_of :name

  def above
    if self.parent_id
      conditions = 
        ["parent_id = ? and seq = ?", self.parent_id, self.seq - 1]
    else
      conditions = 
        ["parent_id is null and seq = ?", self.seq - 1]
    end

    return MenuItem.find(:first,
                         :conditions => conditions)
  end


  def below
    if self.parent_id
      conditions = 
        ["parent_id = ? and seq = ?", self.parent_id, self.seq + 1]
    else
      conditions = 
        ["parent_id is null and seq = ?", self.seq + 1]
    end

    return MenuItem.find(:first,
                         :conditions => conditions)
  end


  def MenuItem.repack(repack_id)
    if repack_id
      items = MenuItem.find(:all,
                            :conditions => "parent_id = #{repack_id}",
                            :order => 'seq')
    else
      items = MenuItem.find(:all,
                            :conditions => "parent_id is null",
                            :order => 'seq')
    end

    seq = 1
    for item in items do
      item.seq = seq
      item.save!
      seq += 1
    end
  end


  def MenuItem.next_seq(parent_id)
    if parent_id and parent_id.to_i > 0
      next_seq = MenuItem.find_by_sql("select coalesce(max(seq) + 1, 1) as seq from menu_items where parent_id = #{parent_id}")
    else
      next_seq = MenuItem.find_by_sql("select coalesce(max(seq) + 1, 1) as seq from menu_items where parent_id is null")
    end

    if next_seq
      return next_seq[0].seq
    else
      return 1
    end
  end


end
