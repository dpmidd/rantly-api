class User < ActiveRecord::Base
  has_many :rants
end
