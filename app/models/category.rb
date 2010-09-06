class Category < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => true,
                   :uniqueness => true,
                   :length => { :maximum => 100 }
end

