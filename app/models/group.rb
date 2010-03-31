class Group < ActiveRecord::Base
  has_role :default => :users

  has_many :users

  attr_accessible :name
end
