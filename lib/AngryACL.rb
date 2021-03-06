require "AngryACL/version"

module AngryACL
  autoload "Acl", 'AngryACL/acl'
  autoload "Resource", 'AngryACL/resource'
  autoload "Builder", 'AngryACL/builder'
  
  def self.build(&block)
    Builder.build(&block)
  end
end
