class Admin < ActiveRecord::Base
  include Authenticable
  
  def full_name
    [first_name, last_name].join(" ")
  end
end
