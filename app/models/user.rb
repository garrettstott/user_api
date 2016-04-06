class User < ActiveRecord::Base
  validates_presence_of :name 
  validates_inclusion_of :alive, in: [true, false]
end
