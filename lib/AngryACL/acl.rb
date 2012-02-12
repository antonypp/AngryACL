module AngryACL
  class Acl
    def initialize
      @roles = []
      @resources = {}
    end
    class << self
      def add_role(role)
        @roles << role
      end
      def add_resource(name, &block)
        @resources[name] = instance_eval(&block) 
      end
    end
    def privilege(name, *roles)
      roles.each do |role|
        raise "no role #{role}" unless @roles.include?(role)
      end
      {name => roles}
    end
    def allow?(*args)
      permiss(*args)
    end
    def check!(*args)
      raise "Permission denied" unless permiss(*args)
      permiss(*args)
    end
    private                                  
    def permiss(resource, action, role)
      @resources[resource][action].include?(role)
    end
  end
end
