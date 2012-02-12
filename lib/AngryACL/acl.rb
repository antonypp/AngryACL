class UndefinedRole < RuntimeError; end
class PermissionDenied < RuntimeError; end

module AngryACL
  class Acl

    def initialize
      @roles = []
      @resources = {}
    end

    def add_role(role)
      @roles << role
    end

    def add_resource(resource)
      @resources[resource.name] = resource
    end

    def allow?(*args)
      permiss(*args)
    end

    def check!(*args)
      raise PermissionDenied unless permiss(*args)
      permiss(*args)
    end

    private                                  

      def permiss(resource, action, role)
        raise UndefinedRole unless @roles.include?(role)
        @resources[resource].permiss(action, role)
      end
  end
end
