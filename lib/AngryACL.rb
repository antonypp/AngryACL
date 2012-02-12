require "AngryACL/version"

module AngryACL
  autoload "Acl", 'AngryACL/acl'
  autoload "Resource", 'AngryACL/resource'
  autoload "Builder", 'AngryACL/builder'
  #autoload "Builder::Roles", "AngryACL/builder/roles"
  # Your code goes here...
  
  def self.build(&block)
    Builder.build(&block)
  end
end
