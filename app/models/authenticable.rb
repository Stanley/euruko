module Authenticable
  def self.included(base)
    base.acts_as_authentic

    base.validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
    base.validates_uniqueness_of :email
    base.validates_presence_of :first_name, :last_name
  end
end
