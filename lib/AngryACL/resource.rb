module AngryACL
  class Resource

    def initialize(name)
      @name = name
      @privilege = {}
    end

    def add_privilege(action, roles)
      @privilege[action] = roles
    end

    def name
      @name
    end

    def permiss(action, role)
      @privilege[action].include? role
    end
  end
end
