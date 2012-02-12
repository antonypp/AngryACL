module AngryACL
  class Builder::Roles
    def initialize(&block)
      @roles = []
      instance_eval(&block)
    end
    def role(name)
      @roles << name
    end
    def self.build(&block)
      new &block

    end
  end
end
