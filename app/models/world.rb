class World < ActiveRecord::Base
  attr_accessible :name, :region
  belongs_to :region
  has_many :guilds
  has_many :users
end
