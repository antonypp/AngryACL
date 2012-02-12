module AngryACL
  class Builder
     attr_reader :attr_resources, :attr_roles
    def initialize(&block)
      @attr_resources = {}
      @attr_roles = []
      instance_eval(&block)
    end

    def self.build(&block)
      inst = new(&block)
      acl = Acl.new
      inst.attr_roles.each do |role|
        acl.add_role(role)
      end
      inst.attr_resources.each_pair do |resource, privileges|
        res = Resource.new(resource)
        privileges.each_pair do |action, roles|
          res.add_privilege(action, roles)
        end
        acl.add_resource(res)
      end
      acl 
    end

    def roles(&block)
      instance_eval(&block)
    end

    def role(role)
      @attr_roles << role
    end
    
    def resource(name, roles = [], &block)
      @res_role = roles
      @res_name = name
      @attr_resources[name] = {} 
      instance_eval(&block)
    end

    def privilege(action, roles, &block)
      roles |= @res_role 
      @attr_resources[@res_name].merge!({action => roles})
    end
  end
end
