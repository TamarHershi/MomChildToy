class Mom < ActiveRecord::Base
  has_many :children

  def self.kids(mom)
    if mom.children.length > 1
      return "#{mom.children.length} kids"
    elsif mom.children.length == 1
      return "1 kid"
    else
      return "no kids"
    end
  end

  def self.check_kids(mom)
    if @mom.kids!= 0
      return true
    end
  end



end
