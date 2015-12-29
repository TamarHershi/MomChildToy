class Child < ActiveRecord::Base
  belongs_to :mom
  has_many :toys


  def self.girl?(child)
    if child.gender == "female"
      return true
    end
  end

  def self.many_toys(child)
    if child.toys.length == 0
      return "no toys 😥"
    elsif child.toys.length == 1
      return "only one toy"
    else
      return "#{child.toys.length} toys"
    end
  end

  def self.many_siblings(child)
    mom = Mom.find(child.mom_id)
    return mom.children.length-1
  end

  def self.gender
    return ["male", "feamle"]
  end
end
