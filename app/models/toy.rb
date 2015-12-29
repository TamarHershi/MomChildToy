class Toy < ActiveRecord::Base
  belongs_to :child

  def self.find_child(toys)
    return toys.first.child_id
  end
end
